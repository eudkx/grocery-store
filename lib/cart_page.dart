// import 'dart:html';

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_store/home_page.dart';
import 'package:grocery_store/models/cart_model.dart';
import 'package:provider/provider.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool button_animation_state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(0, 255, 255, 255),
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        shadowColor: Colors.transparent,
        // iconTheme: IconThemeData(
        //   color: Colors.transparent,
        // ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: ((context) {
                return HomePage();
              }),
            ));
          },
        ),
        // foregroundColor: Colors.transparent,
      ),
      // extendBodyBehindAppBar: true,
      body: Consumer<Cartmodel>(builder: (context, value, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My cart',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        title: Text(value.cartItems[index][0]),
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 36,
                        ),
                        subtitle: Text('\$' + value.cartItems[index][1]),
                        trailing: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            Provider.of<Cartmodel>(context, listen: false)
                                .removeItemFromCart(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    button_animation_state = true;
                  });
                  Timer(const Duration(milliseconds: 250), () {
                    setState(() {
                      button_animation_state = false;
                    });
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 70,
                  decoration: BoxDecoration(
                      color: button_animation_state
                          ? Colors.green
                          : Colors.green[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text('Total price'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text('\$' + value.calculateTotal()),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
