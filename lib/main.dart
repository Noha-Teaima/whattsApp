import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task1/NoteApp/HiveNotes.dart';
import 'package:task1/NoteApp/note.dart';
import 'package:task1/data.dart';
import 'package:task1/BMI.dart';
import 'package:task1/ecomerce/AnotherSignUp.dart';
import 'package:task1/ecomerce/BookingHistory.dart';
import 'package:task1/ecomerce/Categories.dart';
import 'package:task1/ecomerce/onboardingScreen.dart';
import 'package:task1/ecomerce/signUp.dart';

import 'ecomerce/Splash.dart';
import 'ecomerce/slider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.BoxName);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteApp(),
    );
  }
}
