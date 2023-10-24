import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  final String baseUrl = 'http://192.168.1.4:3000';

  Future placeOrder(items) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(baseUrl + "/order"),
        headers: {
          'Content-Type': 'application/json',
          'authorization': "Bearer ${_pref.getString("accessToken")}"
        },
        body: jsonEncode({"order_items": items}));
    return response;
  }

  Future<List<dynamic>> getOrders() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse(baseUrl + "/order"),
      headers: {
        'Content-Type': 'application/json',
        'authorization': "Bearer ${_pref.getString("accessToken")}"
      },
    );

    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.body);

    if (response.statusCode == 200) {
      // Parse the response body into a list of orders
      final List<dynamic> orderList =
          json.decode(response.body) as List<dynamic>;
      print(orderList);
      return orderList;
    } else {
      // Handle errors or non-200 status codes as needed
      throw Exception('Failed to fetch orders');
    }
  }
}
