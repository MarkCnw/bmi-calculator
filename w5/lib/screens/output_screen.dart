import 'package:flutter/material.dart';
import 'package:w5/theme/constants.dart';
import 'package:w5/widget/neumorphic_container.dart';
import 'package:w5/widget/neumorphic_large_button.dart'; // เพิ่ม import นี้

class OutputScreen extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const OutputScreen({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  Color _getResultColor() {
    if (resultText == 'Normal') return kNeumorphicGreen;
    if (resultText == 'Overweight') return kNeumorphicOrange;
    return kNeumorphicRed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25.0),
              alignment: Alignment.bottomLeft,
              child: const Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: NeumorphicContainer(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: _getResultColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: _getResultColor(),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle.copyWith(
                        color: _getResultColor(),
                      ),
                    ),
                  ),
                  Text(bmiResult, style: kBMITextStyle),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // แทนที่ปุ่ม RE-CALCULATE เป็น Neumorphic style
          NeumorphicLargeButton(
            text: 'RE-CALCULATE',
            onPressed: () => Navigator.pop(context),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          ),
        ],
      ),
    );
  }
}
