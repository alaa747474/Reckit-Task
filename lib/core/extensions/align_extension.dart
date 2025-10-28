import 'package:flutter/material.dart';

extension WidgetAlignmentDirectional on Widget {
  Widget get alignCenter => Align(alignment: AlignmentDirectional.center, child: this);
  Widget get alignTopStart => Align(alignment: AlignmentDirectional.topStart, child: this);
  Widget get alignTopEnd => Align(alignment: AlignmentDirectional.topEnd, child: this);
  Widget get alignBottomStart => Align(alignment: AlignmentDirectional.bottomStart, child: this);
  Widget get alignBottomEnd => Align(alignment: AlignmentDirectional.bottomEnd, child: this);
  Widget get alignCenterStart => Align(alignment: AlignmentDirectional.centerStart, child: this);
  Widget get alignCenterEnd => Align(alignment: AlignmentDirectional.centerEnd, child: this);
  Widget get alignTopCenter => Align(alignment: AlignmentDirectional.topCenter, child: this);
  Widget get alignBottomCenter => Align(alignment: AlignmentDirectional.bottomCenter, child: this);
}
