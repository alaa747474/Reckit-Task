import 'package:flutter/material.dart';

/// Custom color extension for theme-specific colors
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? warningColor, statusCardColor;

  const CustomColors({this.warningColor, this.statusCardColor});

  @override
  CustomColors copyWith({Color? borderColor, Color? statusCardColor}) {
    return CustomColors(
      warningColor: borderColor ?? warningColor,
      statusCardColor: statusCardColor ?? statusCardColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      statusCardColor: Color.lerp(statusCardColor, other.statusCardColor, t)!,
    );
  }

  /// Dark theme colors
  static const dark = CustomColors(
    warningColor: Color(0xFFFFC268),
    statusCardColor: Color(0xFFC25F30),
  );
}
