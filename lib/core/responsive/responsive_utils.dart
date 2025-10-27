import 'package:flutter/material.dart';
import '../constants/breakpoints.dart';

enum ScreenType { mobile, tablet, desktop }

class ResponsiveUtils {
  static ScreenType getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    if (width < Breakpoints.mobile) return ScreenType.mobile;
    if (width < Breakpoints.tablet) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  static bool isMobile(BuildContext context) => 
      getScreenType(context) == ScreenType.mobile;
      
  static bool isTablet(BuildContext context) => 
      getScreenType(context) == ScreenType.tablet;
      
  static bool isDesktop(BuildContext context) =>  getScreenType(context) == ScreenType.desktop;

  static double responsiveValue({
    required BuildContext context,
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    final screenType = getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet;
      case ScreenType.desktop:
        return desktop;
    }
  }
}
