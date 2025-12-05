import 'package:flutter/material.dart';
import 'package:w5/theme/constants.dart';

class BgContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const BgContent({
    super.key,
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0, color: color),
        const SizedBox(height: 15.0),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
