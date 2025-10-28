import 'package:flutter/material.dart';

import '../constants/app_sizes.dart'; 

extension WidgetPaddingExtensions on Widget {
  /// Vertical padding
  Widget verticalPadding([double? padding]) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: padding ?? AppSizes.verticalPadding,
      ),
      child: this,
    );
  }

  /// Horizontal padding
  Widget horizontalPadding([double? padding]) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? AppSizes.horizontalPadding,
      ),
      child: this,
    );
  }

  /// Padding on all sides
  Widget allPadding([double? padding]) {
    return Padding(
      padding: EdgeInsets.all(padding ?? AppSizes.horizontalPadding),
      child: this,
    );
  }

  /// Top padding
  Widget topPadding([double? padding]) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: padding ?? AppSizes.topPadding,
      ),
      child: this,
    );
  }

  /// Bottom padding
  Widget bottomPadding([double? padding]) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: padding ?? AppSizes.bottomPadding,
      ),
      child: this,
    );
  }

  /// End padding (Right in LTR)
  Widget endPadding([double? padding]) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: padding ?? AppSizes.horizontalPadding,
      ),
      child: this,
    );
  }

  /// Start padding (Left in LTR)
  Widget startPadding([double? padding]) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: padding ?? AppSizes.horizontalPadding,
      ),
      child: this,
    );
  }
}
