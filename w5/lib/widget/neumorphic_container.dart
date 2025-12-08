import 'package:flutter/material.dart';
import 'package:w5/theme/constants.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final bool isPressed;
  final bool isFlat;
  final double borderRadius;

  const NeumorphicContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.onTap,
    this.isPressed = false,
    this.isFlat = false,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(20.0),
        margin: margin ?? const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: kNeumorphicBackground,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: isFlat
              ? []
              : isPressed
              ? [
                  // Pressed state - inner shadow effect (ชัดขึ้น)
                  BoxShadow(
                    color: kNeumorphicShadowDark.withOpacity(0.7),
                    offset: const Offset(6, 6),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: kNeumorphicShadowLight.withOpacity(1.0),
                    offset: const Offset(-6, -6),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  // Normal state - raised effect (ชัดขึ้นมาก)
                  BoxShadow(
                    color: kNeumorphicShadowDark.withOpacity(0.7),
                    offset: const Offset(10, 10),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: kNeumorphicShadowLight.withOpacity(1.0),
                    offset: const Offset(-10, -10),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
        ),
        child: child,
      ),
    );
  }
}
