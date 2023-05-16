import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // brightness: Brightness.dark,
        elevation: 0,

        backgroundColor: Color.fromARGB(0, 30, 24, 193),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(0, 0, 0, 0),
          // systemNavigationBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          // systemNavigationBarContrastEnforced: false,
          systemNavigationBarIconBrightness: Brightness.dark,
          // systemNavigationBarDividerColor: Colors.black,

          systemNavigationBarColor: Color.fromARGB(247, 0, 0, 0),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 120, horizontal: 80),
              child: Image.asset(
                'lib/images/avocado.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "We deliver groceries at your doorstep",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Text('Fresh items everyday'),
            const SizedBox(
              height: 200,
            ),
            // const Spacer(),
            GestureDetector(
              onTap: (() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return HomePage();
                      }),
                    ),
                  )),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Get started',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      // extendBodyBehindAppBar: true,
    );
  }
}
