import 'package:fe/api/zz_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'screens/zz_screens.dart';
import 'widgets/zz_widgets.dart';

final GoRoute _router = GoRoute(routes: const [], path: '');

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProductProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      )
    ],
    child: const BharatEcom(),
  ));
}

// const MaterialApp(
//       debugShowCheckedModeBanner: false, home: SplashScreen())
class BharatEcom extends StatelessWidget {
  const BharatEcom({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(routes: [
        GoRoute(
            name: "splash",
            path: "/",
            builder: (context, state) => const SplashScreen(),
            routes: [
              GoRoute(
                name: "home",
                path: "home",
                builder: (context, state) => const HomeScreen(),
              ),
              GoRoute(
                name: "search",
                path: "search",
                builder: (context, state) => const SearchScreen(),
              ),
              GoRoute(
                name: "profile",
                path: "profile",
                builder: (context, state) => const ProfileScreen(),
              ),
              GoRoute(
                name: "cart",
                path: "cart",
                builder: (context, state) => const CartScreen(),
              ),
              GoRoute(
                name: "wishlist",
                path: "wishlist",
                builder: (context, state) => const WishlistScreen(),
              )
            ])
      ]),
    );
  }
}
