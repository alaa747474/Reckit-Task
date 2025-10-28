import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';

extension ThemeExtensions on BuildContext {
  CustomColors get customColors {
    return Theme.of(this).extension<CustomColors>() ?? CustomColors.dark;
  }
  
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}