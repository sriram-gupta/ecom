import 'package:fe/widgets/zz_widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          title: 'Profile Screen',
        ),
        drawer: CustomLeftDrawer(),
        bottomNavigationBar: CustomBottomNavBar());
  }
}
