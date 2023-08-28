import 'package:flutter/material.dart';
import 'package:task1/data.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 21, 9),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child:
              CircleAvatar(backgroundImage: AssetImage("lib/images/img2.jfif")),
        ),
      ),
    );
  }
}
