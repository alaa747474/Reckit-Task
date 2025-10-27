import 'package:flutter/material.dart';
import '../responsive/responsive_utils.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: ResponsiveUtils.responsiveValue(
            context: context,
            mobile: 24,
            tablet: 32,
            desktop: 40,
          ),
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: ResponsiveUtils.responsiveValue(
            context: context,
            mobile: 16,
            tablet: 18,
            desktop: 20,
          ),
        ),
      ),
    );
  }

  static EdgeInsets getPagePadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: ResponsiveUtils.responsiveValue(
        context: context,
        mobile: 16,
        tablet: 32,
        desktop: 64,
      ),
      vertical: ResponsiveUtils.responsiveValue(
        context: context,
        mobile: 16,
        tablet: 24,
        desktop: 32,
      ),
    );
  }

  static double getContainerMaxWidth(BuildContext context) {
    return ResponsiveUtils.responsiveValue(
      context: context,
      mobile: double.infinity,
      tablet: 768,
      desktop: 1200,
    );
  }
}