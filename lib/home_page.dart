import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_store/cart_page.dart';
import 'package:grocery_store/models/cart_model.dart';
import 'package:grocery_store/grocery_item_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CardPage();
            }))),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Good Morning",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Let's order fresh items for you",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Fresh items",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: Consumer<Cartmodel>(builder: (context, value, child) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(12.0),
                      itemCount: value.shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                      itemBuilder: ((context, index) {
                        return GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<Cartmodel>(context, listen: false)
                                .addItemtoCard(index);
                          },
                        );
                      }),
                    );
                  }),
                )
              ],
            ),
            // Positioned(
            //   top: MediaQuery.of(context).size.height - 140,
            //   left: MediaQuery.of(context).size.width - 70,
            //   child: GestureDetector(
            //     onDoubleTap: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return CardPage();
            //         },
            //       ),
            //     ),
            //     child: Container(
            //       width: 50,
            //       height: 50,
            //       decoration: BoxDecoration(
            //           color: Colors.black,
            //           borderRadius: BorderRadius.circular(15)),
            //       child: Center(
            //           child: Icon(
            //         Icons.shopping_bag_outlined,
            //         color: Colors.white,
            //       )),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

// class GroceryItemTile {}
