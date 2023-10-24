import 'package:fe/api/order_services.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  Future<List<dynamic>>? orderList;

  @override
  void initState() {
    super.initState();
    orderList = fetchOrders();
  }

  Future<List<dynamic>> fetchOrders() async {
    try {
      final orders = await OrderService().getOrders();
      return orders;
    } catch (error) {
      print('Error fetching orders: $error');
      return <dynamic>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: orderList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final orders = snapshot.data;

            if (orders != null && orders.isNotEmpty) {
              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return OrderListItem(order: order);
                },
              );
            } else {
              return Center(child: Text('No orders available.'));
            }
          } else {
            return Center(child: Text('No orders available.'));
          }
        },
      ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  final dynamic order;

  OrderListItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 90,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: ListTile(
          title: Text('Order Id: ${order['_id']}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Amount: \$${order['totalAmount']}'),
              Text('Date: ${order['orderDate']}'),
            ],
          ),
        ),
      ),
    );
  }
}
