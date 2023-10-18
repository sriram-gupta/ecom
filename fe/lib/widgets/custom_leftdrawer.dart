import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomLeftDrawer extends StatelessWidget {
  const CustomLeftDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              context.pushNamed("home");
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () {
              context.pushNamed("search");
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Cart'),
            onTap: () {
              context.pushNamed("cart");
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Wishlist'),
            onTap: () {
              context.pushNamed("wishlist");
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              context.pushNamed("profile");
            },
          )
        ],
      ),
    );
  }
}
