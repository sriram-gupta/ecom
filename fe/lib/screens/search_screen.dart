import 'package:fe/widgets/zz_widgets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          title: 'Search Screen',
        ),
        drawer: CustomLeftDrawer(),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
