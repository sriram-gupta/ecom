import 'package:carousel_slider/carousel_slider.dart';
import 'package:fe/api/cart_provider.dart';
import 'package:fe/api/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/zz_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();

    // ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // Future<void> products = productProvider.fetchProducts();
    print("Building HomeScreen");
    return Scaffold(
        appBar: const CustomAppBar(title: 'Zubaida'),
        drawer: const CustomLeftDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 40,
                  child: SearchBar(
                    onTap: () {
                      context.go("search");
                    },
                    elevation: const MaterialStatePropertyAll(2),
                    leading: const Icon(Icons.search),
                    trailing: const [Icon(Icons.cancel_outlined)],
                    hintText: ('Search Your Products'),
                    hintStyle: const MaterialStatePropertyAll(
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
                  ),
                ),
              ),
              const HeroCarousel(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Categories",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 10,
              ),
              const CategoryListView(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Popular Products",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) =>
                    productProvider.isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: MediaQuery.sizeOf(context).height,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: productProvider.products.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                dynamic pduct = productProvider.products[index];
                                return Container(
                                  height: 80,
                                  margin: const EdgeInsets.all(10),
                                  color: Colors.black87,
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        pduct['images'][0].toString(),
                                        fit: BoxFit.fitHeight,
                                      ),
                                      Text(pduct['name']),
                                      Positioned(
                                        bottom: 0,
                                        height: 20,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              print('Product Added to cart');
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .addToCart(pduct);
                                            },
                                            child: Text('AddToCart')),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Latest Fashion",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 30,
              ),
              const Placeholder(
                color: Colors.black87,
              )
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar());
  }
}
