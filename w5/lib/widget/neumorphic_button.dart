import 'package:flutter/material.dart';
import 'package:w5/theme/constants.dart';

class NeumorphicButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;

  const NeumorphicButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.width = 56.0,
    this.height = 56.0,
    this.borderRadius = 28.0,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
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
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: kNeumorphicBackground,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: isPressed
              ? [
                  BoxShadow(
                    color: kNeumorphicShadowDark.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: kNeumorphicShadowLight.withOpacity(0.8),
                    offset: const Offset(-2, -2),
                    blurRadius: 5,
                  ),
                ]
              : [
                  BoxShadow(
                    color: kNeumorphicShadowDark.withOpacity(0.5),
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: kNeumorphicShadowLight.withOpacity(0.9),
                    offset: const Offset(-4, -4),
                    blurRadius: 10,
                  ),
                ],
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}