import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});
  final double weight;
  final double height;

  double _bmi = 0;

  double bmiCalculator() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi;
  }

  Color bmiRangeColor() {
    double bmiRangeColor = bmiCalculator();
    if (bmiRangeColor < 25 && bmiRangeColor > 18.5) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  String bmiRange() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
  // Container(width:70,height:70, child:Image(image:AssetImage('assets/images/test.gif'))),

  Image bmiRangeImage() {
    double bmiRangeImage = bmiCalculator();

    if (bmiRangeImage >= 25) {
      return const Image(image: AssetImage('assets/images/workout.gif'));
    } else if (bmiRangeImage > 18.5) {
      return const Image(image: AssetImage('assets/images/normal.gif'));
    } else {
      return const Image(image: AssetImage('assets/images/foood.gif'));
    }
  }

  String bmiInterpetation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. you can eat a bit more.';
    }
  }
}
