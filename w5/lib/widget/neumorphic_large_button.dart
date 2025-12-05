import 'package:flutter/material.dart';
import 'package:w5/theme/constants.dart';

class NeumorphicLargeButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;

  const NeumorphicLargeButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.height = 70.0,
    this.borderRadius = 35.0,
    this.margin,
  });

  @override
  State<NeumorphicLargeButton> createState() => _NeumorphicLargeButtonState();
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
                  // Pressed state - reduced shadows
                  BoxShadow(
                    color: kNeumorphicShadowDark.withOpacity(0.4),
                    offset: const Offset(3, 3),
                    blurRadius: 6,
                  ),
                  BoxShadow(
                    color: kNeumorphicShadowLight.withOpacity(0.8),
                    offset: const Offset(-3, -3),
                    blurRadius: 6,
                  ),
                ]
              : [
                  // Normal state - prominent shadows
                  BoxShadow(
                    color: kNeumorphicShadowDark.withOpacity(0.5),
                    offset: const Offset(6, 6),
                    blurRadius: 12,
                  ),
                  BoxShadow(
                    color: kNeumorphicShadowLight.withOpacity(0.9),
                    offset: const Offset(-6, -6),
                    blurRadius: 12,
                  ),
                ],
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
