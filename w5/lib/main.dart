import 'package:flutter/material.dart';
import 'package:w5/screens/input_screen.dart';
import 'package:w5/theme/constants.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kNeumorphicBackground,
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: kNeumorphicBackground,
          elevation: 0,
          iconTheme: IconThemeData(color: kNeumorphicTextPrimary),
          titleTextStyle: TextStyle(
            color: kNeumorphicTextPrimary,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      home: const InputScreen(),
    );
  }
}