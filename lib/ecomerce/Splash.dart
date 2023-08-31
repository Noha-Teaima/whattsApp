import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task1/ecomerce/AnotherSignUp.dart';

import 'package:task1/ecomerce/onboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _color = Color.fromARGB(255, 19, 84, 174);
  Color _textColor = Colors.white;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _color = Colors.white;
      _textColor = Color.fromARGB(255, 19, 84, 174);
      // image = "lib/images/category6.jpg";
      setState(() {});
    });
    Future.delayed(Duration(seconds: 4))
        .then((value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Carsoule()),
              (Route<dynamic> route) => false,
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: _textColor,
                    size: 20,
                  ),
                  Container(
                      // height: double.infinity,
                      // width: double.infinity,
                      child: Text(
                    "Shopping",
                    style: TextStyle(color: _textColor, fontSize: 30),
                  )),
                ],
              ),
            ],
          ),
        )

        //     body: Expanded(
        //         child: Container(
        //   child: Image(image: AssetImage(image)
        //   ),
        // )
        // )
        );
  }
}
