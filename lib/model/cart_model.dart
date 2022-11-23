import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopList = [
    [
      "Avocado",
      "4.00",
      "https://cdn-icons-png.flaticon.com/128/2503/2503814.png",
      Colors.green
    ],
    [
      "Banana",
      "2.50",
      "https://cdn-icons-png.flaticon.com/128/2909/2909808.png",
      Colors.yellow
    ],
    [
      "Chicken",
      "12.00",
      "https://cdn-icons-png.flaticon.com/128/2195/2195195.png",
      Colors.brown
    ],
    [
      "Water",
      "1.00",
      "https://cdn-icons-png.flaticon.com/128/824/824239.png",
      Colors.blue
    ],
  ];

  List _cartItems = [];
  get ShopItems => _shopList;

  get CartItems => _cartItems;

  void addItemCart(int index) {
    _cartItems.add(_shopList[index]);
    notifyListeners();
  }

  void removeItemCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }
    return total.toStringAsFixed(2);
  }
}
