import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/widget/reusableCardGeneder.dart';
import 'package:bmi_calculator/widget/reusableCard.dart';

import 'package:bmi_calculator/constants.dart';

import 'package:bmi_calculator/widget/bottomButton.dart';
import '../calculatorBrain.dart';
import 'resultPage.dart';
import 'package:bmi_calculator/widget/roundIconButton.dart';
import 'package:bmi_calculator/widget/switchTheme.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});
  final String title;
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          MySwitchTheme(),
        ],
        centerTitle: true,
        title: Text(widget.title.toUpperCase()),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                //               Theme(
                // data: ThemeData.from(
                //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
                // ),
                Expanded(
                    child: ReusableCardGeneder(
                  onTap: () {
                    setState(() {
                      selectedGeneder = Geneder.male;
                    });
                  },
                  colour: selectedGeneder == Geneder.male
                      ? kActiveGenderColor
                      : Theme.of(context).colorScheme.primaryContainer,
                  icon: FontAwesomeIcons.mars,
                  genderLabel: 'MALE',
                )),
                Expanded(
                    child: ReusableCardGeneder(
                  onTap: () {
                    setState(() {
                      selectedGeneder = Geneder.female;
                    });
                  },
                  colour: selectedGeneder == Geneder.female
                      ? kActiveGenderColor
                      : Theme.of(context).colorScheme.primaryContainer,
                  icon: FontAwesomeIcons.venus,
                  genderLabel: 'FEMALE',
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                  colour: Theme.of(context).colorScheme.primaryContainer,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            userHeight.toString(),
                            style: kNumberTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: const Color(0XFFFFFFFF),
                          inactiveTrackColor: const Color(0XFF8D8E98),
                          thumbColor: const Color(0xFF9CEBBD),
                          overlayColor: const Color(0X299CEBBD),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                        ),
                        child: Slider(
                            value: userHeight.toDouble(),
                            min: 100,
                            max: 220,
                            onChanged: (double newvalue) {
                              setState(() {
                                userHeight = newvalue.round();
                              });
                            }),
                      )
                    ],
                  ))),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: Theme.of(context).colorScheme.primaryContainer,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        userWeight.toString(),
                        style: kNumberTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  if (userWeight > 0) userWeight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: Theme.of(context).colorScheme.primaryContainer,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        userAge.toString(),
                        style: kNumberTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  if (userAge > 0) userAge--;
                                });
                              },
                              icon: FontAwesomeIcons.minus),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  userAge++;
                                });
                              },
                              icon: FontAwesomeIcons.plus),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            label: 'Calculate',
            onTap: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(
                  height: userHeight.toDouble(), weight: userWeight.toDouble());
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultPage(
                      rangeImage: calculatorBrain.bmiRangeImage(),
                      bmiRangeColor: calculatorBrain.bmiRangeColor(),
                      bmiRange: calculatorBrain.bmiRange(),
                      bmiResult: calculatorBrain.bmiCalculator(),
                      bmiInterpetator: calculatorBrain.bmiInterpetation())));
            },
          )
        ],
      ),
    );
  }
}
