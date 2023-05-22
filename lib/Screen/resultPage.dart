import 'package:bmi_calculator/widget/reusableCard.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

import 'package:bmi_calculator/widget/bottomButton.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.rangeImage,
      required this.bmiRangeColor,
      required this.bmiRange,
      required this.bmiResult,
      required this.bmiInterpetator});
  final Widget rangeImage;
  final Color bmiRangeColor;
  final String bmiRange;
  final double bmiResult;
  final String bmiInterpetator;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title.toUpperCase()),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReusableCard(
              colour: Theme.of(context).colorScheme.primaryContainer,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Text(
                      bmiRange.toUpperCase(),
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: bmiRangeColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                    style: kResultNumberTextStyle,
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(40),
                        alignment: Alignment.center,
                        child: rangeImage),
                  ),
                  Container(
                    margin: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    child: Text(
                      bmiInterpetator,
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle,
                    ),
                  )
                ],
              ),
            ),
          )),
          BottomButton(
            label: 'Re-Calculate',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
