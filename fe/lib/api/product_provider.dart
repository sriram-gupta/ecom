import 'package:fe/api/product_services.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = true;
  final ProductService _productService = ProductService();
  List<dynamic> products = [];

  Future<void> fetchProducts() async {
    try {
      final fetchedProducts = await _productService.getProducts();
      print(fetchedProducts);
      products = fetchedProducts;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      products = [];
      notifyListeners();
    }
  }
}
