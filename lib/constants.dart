import 'package:flutter/material.dart';

enum Geneder { male, female }

String title = 'BMI Calculator';
int userHeight = 120;
int userWeight = 85;
int userAge = 0;

var selectedGeneder;
Color activeCard = kInactiveCardColor;
const kNumberTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);

const kLabelTextStyle = TextStyle(fontSize: 18, color: Color(0XFF8D8E98));
// const kActiveCardColor = Color(0xFF1D1E33);
const kActiveGenderColor = Color(0xFF9CEBBD);

const kInactiveCardColor = Color(0xFF111328);
const kBottomContainerColor = Color(0xFF9CEBBD);
const kBottomContainerHeight = 80.0;
const kCalculateTextStyle =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

const kResultNumberTextStyle =
    TextStyle(fontSize: 150.0, fontWeight: FontWeight.w900);
final kTitleTextStyleResult = TextStyle(
    fontSize: 30, color: Colors.grey.shade300, fontWeight: FontWeight.bold);
