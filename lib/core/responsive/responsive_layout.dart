import 'package:flutter/material.dart';
import 'package:reckit_task/core/responsive/responsive_builder.dart';
import 'responsive_utils.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenType) {
        switch (screenType) {
          case ScreenType.mobile:
            return mobile;
          case ScreenType.tablet:
            return tablet;
          case ScreenType.desktop:
            return desktop;
        }
      },
    );
  }
}