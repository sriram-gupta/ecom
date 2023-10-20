import 'package:fe/api/zz_providers.dart';
import 'package:fe/widgets/zz_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cart Screen',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                if (cartProvider.isLoading) {
                  return CircularProgressIndicator();
                }

                if (cartProvider.products.isEmpty) {
                  return Center(
                    child: Text('Your cart is empty.'),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartProvider.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    dynamic product = cartProvider.products[index];

                    return Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 4,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.network(
                              product['images'][0].toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    product['name'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '\$${product['price']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Implement your "Delete from Cart" logic here
                              cartProvider.deleteFromCart(product);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Implement your "Buy" logic here
                  },
                  child: Text('Buy'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement your "Checkout" logic here
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: CustomLeftDrawer(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
