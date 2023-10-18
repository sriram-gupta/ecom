import 'package:fe/widgets/zz_widgets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          title: 'Cart Screen',
        ),
        drawer: CustomLeftDrawer(),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
