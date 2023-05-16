import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/intro_page.dart';
import 'package:grocery_store/models/cart_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.red,
      // systemNavigationBarDividerColor: Colors.red,
      statusBarColor: Color.fromARGB(255, 0, 0, 0),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cartmodel(),
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            primarySwatch: Colors.grey,
          ),
          debugShowCheckedModeBanner: false,
          home: IntroPage(),
        )
        // return MaterialApp(
        //   theme: ThemeData(
        //     fontFamily: GoogleFonts.montserrat().fontFamily,
        //     primarySwatch: Colors.grey,
        //   ),
        //   debugShowCheckedModeBanner: false,
        //   home: IntroPage(),
        );
  }
}
