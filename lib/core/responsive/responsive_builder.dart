import 'package:flutter/material.dart';
import 'responsive_utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ScreenType screenType) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = ResponsiveUtils.getScreenType(context);
        return builder(context, screenType);
      },
    );
  }
}

