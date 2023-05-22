import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ReusableCardGeneder extends StatelessWidget {
  const ReusableCardGeneder(
      {super.key,
      required this.genderLabel,
      required this.icon,
      required this.onTap,
      required this.colour});
  final IconData icon;
  final VoidCallback onTap;
  final Color colour;
  final String genderLabel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 80.0),
            Text(genderLabel, style: kLabelTextStyle)
          ],
        ),
      ),
    );
  }
}
