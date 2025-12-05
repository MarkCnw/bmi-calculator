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
                      // Inner shadow effect
                      BoxShadow(
                        color: kNeumorphicShadowDark.withOpacity(0.5),
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: kNeumorphicShadowLight.withOpacity(0.8),
                        offset: const Offset(-4, -4),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ]
                  : [
                      // Raised effect
                      BoxShadow(
                        color: kNeumorphicShadowDark.withOpacity(0.5),
                        offset: const Offset(8, 8),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: kNeumorphicShadowLight.withOpacity(0.9),
                        offset: const Offset(-8, -8),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
        ),
        child: child,
      ),
    );
  }
}