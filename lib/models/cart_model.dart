import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier {
  final List _shopitems = [
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "12.00", "lib/images/chicken.png", Colors.brown],
    ["Water", "1.00", "lib/images/water.png", Colors.blue],
  ];

  List _cardItems = [];
  get shopItems => _shopitems;

  get cartItems => _cardItems;

  void addItemtoCard(int index) {
    _cardItems.add(_shopitems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cardItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;

    for (int i = 0; i < _cardItems.length; i++) {
      totalPrice += double.parse(_cardItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
