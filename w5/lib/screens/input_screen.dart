import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:w5/theme/constants.dart';
import 'package:w5/widget/neumorphic_container.dart';
import 'package:w5/widget/neumorphic_button.dart';
import 'package:w5/widget/neumorphic_large_button.dart';
import 'dart:math';

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
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Gender Selection (ใช้ AspectRatio เพื่อคุมความสูง)
                    Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1.1, // เพิ่มความสูงการ์ดเล็กน้อย
                            child: NeumorphicContainer(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 12,
                              ),
                              isPressed: selectedGender == Gender.male,
                              onTap: () => setState(
                                () => selectedGender = Gender.male,
                              ),
                              child: FittedBox(
                                // ป้องกันล้น โดยให้คอนเทนต์หดได้
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.face,
                                      size: 64, // ลดจาก 70–80
                                      color: selectedGender == Gender.male
                                          ? kNeumorphicAccent
                                          : kNeumorphicTextSecondary,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ), // ลดระยะห่าง
                                    Text(
                                      'MALE',
                                      style: kLabelTextStyle.copyWith(
                                        height: 1.1, // ลด line-height
                                        color:
                                            selectedGender == Gender.male
                                            ? kNeumorphicAccent
                                            : kNeumorphicTextSecondary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1.1,
                            child: NeumorphicContainer(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 12,
                              ),
                              isPressed: selectedGender == Gender.female,
                              onTap: () => setState(
                                () => selectedGender = Gender.female,
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.face_2,
                                      size: 64,
                                      color:
                                          selectedGender == Gender.female
                                          ? kNeumorphicAccent
                                          : kNeumorphicTextSecondary,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'FEMALE',
                                      style: kLabelTextStyle.copyWith(
                                        height: 1.1,
                                        color:
                                            selectedGender == Gender.female
                                            ? kNeumorphicAccent
                                            : kNeumorphicTextSecondary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Height card (ลด padding + ไม่ใช้ Expanded ด้านใน)
                    NeumorphicContainer(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('HEIGHT', style: kLabelTextStyle),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              const SizedBox(width: 4),
                              const Text('cm', style: kLabelTextStyle),
                            ],
                          ),
                          const SizedBox(height: 14),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: kNeumorphicAccent,
                              inactiveTrackColor: kNeumorphicShadowDark
                                  .withOpacity(0.3),
                              thumbColor: kNeumorphicAccent,
                              overlayColor: kNeumorphicAccent.withOpacity(
                                0.2,
                              ),
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 14.0,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 24.0,
                              ),
                              trackHeight: 4.0,
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) => setState(
                                () => height = newValue.round(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Weight & Age cards
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: NeumorphicContainer(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  'WEIGHT',
                                  style: kLabelTextStyle,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      weight.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'kg',
                                      style: kLabelTextStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: <Widget>[
                                    NeumorphicButton(
                                      onPressed: () {
                                        if (weight > 1)
                                          setState(() => weight--);
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.minus,
                                        color: kNeumorphicTextPrimary,
                                        size: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    NeumorphicButton(
                                      onPressed: () =>
                                          setState(() => weight++),
                                      child: const Icon(
                                        FontAwesomeIcons.plus,
                                        color: kNeumorphicTextPrimary,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: NeumorphicContainer(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('AGE', style: kLabelTextStyle),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      age.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'yr',
                                      style: kLabelTextStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: <Widget>[
                                    NeumorphicButton(
                                      onPressed: () {
                                        if (age > 1) setState(() => age--);
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.minus,
                                        color: kNeumorphicTextPrimary,
                                        size: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    NeumorphicButton(
                                      onPressed: () =>
                                          setState(() => age++),
                                      child: const Icon(
                                        FontAwesomeIcons.plus,
                                        color: kNeumorphicTextPrimary,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Calculate Button
                    NeumorphicLargeButton(
                      text: 'CALCULATE',
                      onPressed: calculateAndNavigate,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
