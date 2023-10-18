import 'package:fe/widgets/zz_widgets.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          title: 'Wishlist Screen',
        ),
        drawer: CustomLeftDrawer(),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
