import 'package:flutter/material.dart';

class Boxer extends StatelessWidget {
  Widget child;
  Boxer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: child,
    );
  }
}
