import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List products = [];

  void addToCart(p) {
    products.add(p);
    notifyListeners();
  }

  void deleteFromCart(p) {
    int index = products.indexWhere((element) => element['id'] == p['id']);
    products.removeAt(index);
    notifyListeners();
  }
}
