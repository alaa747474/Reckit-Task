import 'package:flutter/material.dart';

/// Custom color extension for theme-specific colors
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? warningColor, statusCardColor,selectedColor,unselectedColor;

  const CustomColors({this.warningColor, this.statusCardColor, this.selectedColor,this.unselectedColor});

  @override
  CustomColors copyWith({Color? borderColor, Color? statusCardColor}) {
    return CustomColors(
      warningColor: borderColor ?? warningColor,
      statusCardColor: statusCardColor ?? statusCardColor,
      selectedColor: selectedColor ?? selectedColor,
      unselectedColor: unselectedColor ?? unselectedColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      statusCardColor: Color.lerp(statusCardColor, other.statusCardColor, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t)!,
    );
  }

  /// Dark theme colors
  static const dark = CustomColors(
    warningColor: Color(0xFFFFC268),
    statusCardColor: Color(0xFFC25F30),
    selectedColor: Colors.white,
    unselectedColor: Color(0xFF999999),
  );
}
