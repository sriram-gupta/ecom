import 'package:fe/api/product_services.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();
  List<dynamic> products = [];

  Future<void> fetchProducts() async {
    final fetchedProducts = await _productService.getProducts();
    products = fetchedProducts;
    notifyListeners();
  }
}
