import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double width = 0;
  double heigth = 0;
  double bmi = 0;
  void BMI() {
    bmi = width * heigth;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("the width is $width m"),
            Slider(
                value: width,
                min: 0,
                activeColor: Colors.green,
                max: 100,
                divisions: 10,
                label: "$width",
                onChanged: (double num) {
                  width = num;
                  setState(() {});
                }),
            Text("the heigth is $heigth m"),
            Slider(
                value: heigth,
                min: 0,
                max: 100,
                activeColor: Colors.green,
                label: "$heigth",
                divisions: 10,
                onChanged: (double num) {
                  heigth = num;
                  setState(() {});
                }),
            ElevatedButton(
                onPressed: BMI,
                child: Text("Calculate BMI"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green)),
            Text("the BMI is $bmi m"),
          ],
        ),
      ),
    );
  }
}
