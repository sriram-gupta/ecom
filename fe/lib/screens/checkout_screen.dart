import 'package:fe/api/order_services.dart';
import 'package:fe/api/zz_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('UPI'),
              leading: Radio<String>(
                value: 'UPI',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Credit Card'),
              leading: Radio<String>(
                value: 'Credit Card',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Cash on Delivery'),
              leading: Radio<String>(
                value: 'Cash on Delivery',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your payment processing logic based on the selectedPaymentMethod
                if (selectedPaymentMethod == 'Cash on Delivery') {
                  // Process Cash on Delivery
                  OrderService().placeOrder(cartProvider.products);

                  print('Processing Cash on Delivery');
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Payment Successful'),
                        content:
                            Text('Cash on delivery  processed successfully.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              context.goNamed("orderList");
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (selectedPaymentMethod == 'UPI') {
                  // Navigate to AddUPIScreen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddUPIScreen(),
                  ));
                } else if (selectedPaymentMethod == 'Credit Card') {
                  // Navigate to AddCardDetailsScreen
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddCardDetailsScreen(),
                  ));
                }
              },
              child: Text(selectedPaymentMethod == 'Cash on Delivery'
                  ? 'Place Order'
                  : 'Pay'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddUPIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add UPI Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter UPI ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your UPI payment processing logic here
                // Replace with the actual payment processing code
                OrderService()
                    .placeOrder(Provider.of<CartProvider>(context).products);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Payment Successful'),
                      content: Text('UPI payment processed successfully.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.goNamed("orderList");
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('PAY'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Expiration Date'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'CVV'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your credit card payment processing logic here
                // Replace with the actual payment processing code
                OrderService()
                    .placeOrder(Provider.of<CartProvider>(context).products);
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Payment Successful'),
                      content:
                          Text('Credit card payment processed successfully.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.goNamed("orderList");
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('PAY'),
            ),
          ],
        ),
      ),
    );
  }
}
