import 'package:flutter/material.dart';
import 'package:w5/theme/constants.dart';
import 'package:w5/widget/bg_card.dart';

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
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: BgCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kResultTextStyle),
                  Text(bmiResult, style: kBMITextStyle),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
