import 'package:fe/widgets/zz_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        // context.goNamed("login");
        context.pushReplacement("/login");
      },
    );

    return Boxer(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/bg.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5)
                  ])),
            ),
            const Positioned(
              top: 500,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lottie.asset("assets/animations/splash.json"),

                  Divider(
                    height: 100,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_rounded,
                        size: 30,
                      ),
                      Text(
                        ' Zubaida',
                        style: TextStyle(
                            color: Color.fromARGB(255, 247, 246, 246),
                            fontSize: 50,
                            fontFamily: 'sans-serif',
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Carry Your Style: New You !',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
