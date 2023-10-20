import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  bool isLoading = true;
  List products = [];
  final String cartKey =
      'cart'; // Key to store the cart data in SharedPreferences

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  CartProvider() {
    // Load cart data from local storage when the CartProvider is initialized.
    loadCartFromLocalStorage();
    Future.delayed(
      Duration(seconds: 3),
      () {
        isLoading = false;
        notifyListeners();
      },
    );
  }

  void addToCart(p) async {
    products.add(p);
    notifyListeners();

    // Save the updated cart to local storage.
    await saveCartToLocalStorage();
  }

  void deleteFromCart(p) async {
    int index = products.indexWhere((element) => element['id'] == p['id']);
    products.removeAt(index);
    notifyListeners();
    // Save the updated cart to local storage.
    await saveCartToLocalStorage();
  }

  Future<void> saveCartToLocalStorage() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> cartData =
        products.map((product) => jsonEncode(product)).toList();
    await prefs.setStringList(cartKey, cartData);
  }

  Future<void> loadCartFromLocalStorage() async {
    final SharedPreferences prefs = await _prefs;
    final List<String> cartData = prefs.getStringList(cartKey) ?? [];
    print(cartData);
    products = cartData.map((data) => jsonDecode(data)).toList();
  }
}
