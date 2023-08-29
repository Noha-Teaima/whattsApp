import 'package:flutter/material.dart';
import 'package:task1/data.dart';
import 'package:task1/BMI.dart';
import 'package:task1/ecomerce/AnotherSignUp.dart';
import 'package:task1/ecomerce/BookingHistory.dart';
import 'package:task1/ecomerce/signUp.dart';
import 'package:task1/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingHistory(),
    );
  }
}
