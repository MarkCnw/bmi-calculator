import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:w5/theme/constants.dart';
import 'package:w5/widget/circle_button.dart';

class CounterCard extends StatelessWidget {
  final String label;
  final int value;
  final String unit; // เพิ่มหน่วย เช่น kg, yr
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(label, style: kLabelTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.baseline, // จัดฐานตัวหนังสือให้เท่ากัน
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value.toString(), style: kNumberTextStyle),
            const SizedBox(width: 5), // ระยะห่างระหว่างตัวเลขกับหน่วย
            Text(unit, style: kLabelTextStyle), // แสดงหน่วยเล็กๆ ข้างหลัง
          ],
        ),
        const SizedBox(height: 10), // เว้นระยะห่างก่อนถึงปุ่ม
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ปุ่มลบ
            CircleButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onDecrement,
            ),
            const SizedBox(
              width: 15.0,
            ), // เว้นระยะห่างระหว่างปุ่มให้กว้างขึ้นนิดนึง
            // ปุ่มบวก
            CircleButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onIncrement,
            ),
          ],
        ),
      ],
    );
  }
}
