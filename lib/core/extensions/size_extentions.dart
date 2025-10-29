import 'package:flutter/material.dart';
import 'package:reckit_task/core/constants/breakpoints.dart';
import 'package:reckit_task/main.dart'; // contains your global navigatorKey

/// ✅ Use navigatorKey to access context globally
BuildContext? get _ctx => navigatorKey.currentContext;

/// ✅ Extension on num for responsive sizing (like ScreenUtil)
extension ResponsiveSize on num {
  /// Responsive font size (sp - Scaled Pixels)
  double get sp {
    final context = _ctx;
    if (context == null) return toDouble();

    final width = MediaQuery.of(context).size.width;
    if (Breakpoints.isMobile(width)) {
      return toDouble();
    } else if (Breakpoints.isTablet(width)) {
      return toDouble() * 1.15;
    } else {
      return toDouble() * 1.25;
    }
  }

  /// Responsive width
  double get w {
    final context = _ctx;
    if (context == null) return toDouble();

    final screenWidth = MediaQuery.of(context).size.width;
    const designWidth = 1200;
    return (this * screenWidth) / designWidth;
  }

  /// Responsive height
  double get h {
    final context = _ctx;
    if (context == null) return toDouble();

    final screenHeight = MediaQuery.of(context).size.height;
    const designHeight = 812.0;
    return (this * screenHeight) / designHeight;
  }

  /// Responsive radius/padding (based on smaller axis)
  double get r {
    final context = _ctx;
    if (context == null) return toDouble();

    final size = MediaQuery.of(context).size;
    const designWidth = 375.0;
    const designHeight = 812.0;

    final scaleWidth = size.width / designWidth;
    final scaleHeight = size.height / designHeight;

    return toDouble() * (scaleWidth < scaleHeight ? scaleWidth : scaleHeight);
  }

  /// Responsive value based on device type
  double responsive({double? tablet, double? desktop}) {
    final context = _ctx;
    if (context == null) return toDouble();

    final width = MediaQuery.of(context).size.width;
    if (Breakpoints.isDesktop(width) && desktop != null) return desktop;
    if (Breakpoints.isTablet(width) && tablet != null) return tablet;
    return toDouble();
  }
}

/// ✅ Extension for EdgeInsets (responsive)
extension ResponsiveEdgeInsets on EdgeInsets {
  EdgeInsets get r {
    final context = _ctx;
    if (context == null) return this;

    return EdgeInsets.only(
      left: left.r,
      top: top.r,
      right: right.r,
      bottom: bottom.r,
    );
  }

  EdgeInsets get w {
    final context = _ctx;
    if (context == null) return this;

    return EdgeInsets.only(
      left: left.w,
      top: top.w,
      right: right.w,
      bottom: bottom.w,
    );
  }

  EdgeInsets get h {
    final context = _ctx;
    if (context == null) return this;

    return EdgeInsets.only(
      left: left.h,
      top: top.h,
      right: right.h,
      bottom: bottom.h,
    );
  }
}

/// ✅ Extension for BorderRadius
extension ResponsiveBorderRadius on BorderRadius {
  BorderRadius get r {
    return BorderRadius.only(
      topLeft: topLeft.r,
      topRight: topRight.r,
      bottomLeft: bottomLeft.r,
      bottomRight: bottomRight.r,
    );
  }
}

/// ✅ Extension for Radius
extension ResponsiveRadius on Radius {
  Radius get r => Radius.circular(x.r);
}

/// ✅ Extension for SizedBox
extension ResponsiveSizedBox on SizedBox {
  SizedBox get r {
    return SizedBox(
      width: width?.r,
      height: height?.r,
    );
  }
}
