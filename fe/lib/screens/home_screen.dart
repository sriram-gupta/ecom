import 'package:carousel_slider/carousel_slider.dart';
import 'package:fe/api/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/zz_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // Future<void> products = productProvider.fetchProducts();

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
                    onTap: () {},
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 80,
                      margin: const EdgeInsets.all(10),
                      color: Colors.black87,
                      padding: const EdgeInsets.all(10),
                    );
                  },
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
