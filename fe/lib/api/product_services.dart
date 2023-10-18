import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String apiUrl = 'http://192.168.1.4:5000/products';

  Future<List<dynamic>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final products = data['products'].map((item) {
        return ({
          "id": item['id'],
          "name": item['title'],
          "description": item['description'],
          "price": item['price'].toDouble(),
          "discountPercentage": item['discountPercentage'],
          "rating": item['rating'],
          "stock": item['stock'],
          "brand": item['brand'],
          "category": item['category'],
          "thumbnail": item['thumbnail'],
          "images": List<String>.from(item['images']),
        });
      }).toList();

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
