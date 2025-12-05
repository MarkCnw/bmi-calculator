import 'package:flutter/material.dart';
import 'package:w5/theme/constants.dart';
import 'package:w5/widget/neumorphic_container.dart';

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
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              height: 70.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kNeumorphicAccent,
                    kNeumorphicAccent.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                    color: kNeumorphicAccent.withOpacity(0.3),
                    offset: const Offset(0, 8),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: const Center(
                child: Text('RE-CALCULATE', style: kLargeButtonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}