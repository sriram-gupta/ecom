import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/c5.jpg',
      'assets/images/c4.jpg',
      'assets/images/c3.jpg',
      'assets/images/c2.jpg',
      'assets/images/c1.jpg'
    ];
    return SizedBox(
      height: 120,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: imgList
              .map((e) => Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Stack(children: [
                      Image.asset(
                        e,
                        fit: BoxFit.cover,
                        width: 200.0,
                      ),
                      Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: const Text(
                              'Zara',
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ]),
                  ))
              .toList()),
    );
  }
}
