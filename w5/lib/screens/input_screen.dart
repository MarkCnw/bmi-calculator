import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:w5/theme/constants.dart';
import 'package:w5/widget/bg_card.dart';
import 'package:w5/widget/bg_content.dart';
import 'package:w5/widget/circle_button.dart';
import 'dart:math'; // สำหรับคำนวณ pow()

import 'output_screen.dart';

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  // ฟังก์ชันคำนวณ BMI
  void calculateAndNavigate() {
    double bmi = weight / pow(height / 100, 2);
    String bmiResult = bmi.toStringAsFixed(1);
    String resultText;
    String interpretation;

    if (bmi >= 25) {
      resultText = 'Overweight';
      interpretation =
          'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      resultText = 'Normal';
      interpretation = 'You have a normal body weight. Good job!';
    } else {
      resultText = 'Underweight';
      interpretation =
          'You have a lower than normal body weight. You can eat a bit more.';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputScreen(
          bmiResult: bmiResult,
          resultText: resultText,
          interpretation: interpretation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BgCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const BgContent(
                      icon: Icons.face,
                      label: 'MALE',
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  child: BgCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const BgContent(
                      icon: Icons.face_3,
                      label: 'FEMALE',
                      color: Colors.pink,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BgCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color.fromARGB(
                        255,
                        149,
                        152,
                        141,
                      ),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BgCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            CircleButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BgCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            CircleButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculateAndNavigate();
            },
            child: Container(
              // ใส่ margin รอบด้านเพื่อให้ปุ่มลอยไม่ติดขอบ
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              width: double.infinity,
              height: 70.0, // ปรับความสูงให้พอดี
              decoration: BoxDecoration(
                color: kBottomContainerColor,
                // ทำมุมมนทั้ง 4 ด้านเป็นรูปแคปซูล
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x66EB1555), // เงาสีชมพูจางๆ
                    offset: Offset(0, 4),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: const Center(
                child: Text('CALCULATE', style: kLargeButtonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
