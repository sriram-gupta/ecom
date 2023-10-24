import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      shadowColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                context.pushNamed("home");
              },
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                context.pushNamed("search");
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                context.pushNamed("cart");
              },
              icon: const Icon(Icons.shopping_bag)),
          IconButton(
              onPressed: () {
                context.pushNamed("orderList");
              },
              icon: const Icon(Icons.person))
        ],
      ),
    );
  }
}
