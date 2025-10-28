import 'package:flutter/material.dart';
import 'package:reckit_task/core/constants/breakpoints.dart';
import 'package:reckit_task/main.dart';

/// A responsive size manager that automatically adapts
/// all UI measurements (padding, radius, etc.) based on device type.
class AppSizes {
  static BuildContext? get _context => navigatorKey.currentContext;

  static double get _width =>
      _context != null ? MediaQuery.of(_context!).size.width : 375;

  /// Scale factor depending on device type
  static double get _scale {
    if (Breakpoints.isMobile(_width)) {
      return 1.0; // 📱 mobile base scale
    } else if (Breakpoints.isTablet(_width)) {
      return 1.8; // 💻 tablet
    } else {
      return 3; // 🖥 desktop/web
    }
  }

  // 🧱 Padding
  static double get horizontalPadding => 24 * _scale;
  static double get verticalPadding => 16 * _scale;
  static double get topPadding => 32 * _scale;
  static double get bottomPadding => 32 * _scale;

  // 📏 Heights
  static double get buttonHeight => 52 * _scale;
  static double get appBarHeight => 56 * _scale;

  // 🟢 Border Radius
  static double get borderRadiusSmall => 8 * _scale;
  static double get borderRadiusMedium => 10 * _scale;
  static double get borderRadiusLarge => 16 * _scale;

  // 🎯 Icon Sizes
  static double get iconSizeSmall => 16 * _scale;
  static double get iconSizeMedium => 24 * _scale;
  static double get iconSizeLarge => 32 * _scale;

  // 🧰 Spacing (optional extras)
  static double get spacingSmall => 8 * _scale;
  static double get spacingMedium => 16 * _scale;
  static double get spacingLarge => 24 * _scale;
}
