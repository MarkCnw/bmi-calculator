import 'package:flutter/material.dart';
import 'package:w5/theme/constants.dart';

class NeumorphicLargeButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;

  const NeumorphicLargeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 70.0,
    this.borderRadius = 35.0,
    this.margin,
  });

  @override
  State<NeumorphicLargeButton> createState() =>
      _NeumorphicLargeButtonState();
}

class _NeumorphicLargeButtonState extends State<NeumorphicLargeButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: widget.height,
        margin: widget.margin,
        decoration: BoxDecoration(
          color: kNeumorphicBackground,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: isPressed
              ? [
                  // Pressed state - เงาชัดขึ้น
                  BoxShadow(
                    color: kNeumorphicShadowDark.withOpacity(0.6),
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: kNeumorphicShadowLight.withOpacity(1.0),
                    offset: const Offset(-4, -4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  // Normal state - เงาชัดขึ้นมาก
                  BoxShadow(
                    color: kNeumorphicShadowDark.withOpacity(0.7),
                    offset: const Offset(8, 8),
                    blurRadius: 18,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: kNeumorphicShadowLight.withOpacity(1.0),
                    offset: const Offset(-8, -8),
                    blurRadius: 18,
                    spreadRadius: 2,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: kLargeButtonTextStyle.copyWith(
              color: isPressed
                  ? kNeumorphicAccent.withOpacity(0.7)
                  : kNeumorphicAccent,
            ),
          ),
        ),
      ),
    );
  }
}
