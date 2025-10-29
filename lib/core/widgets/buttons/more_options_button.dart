import 'package:flutter/material.dart';
import 'package:reckit_task/core/constants/assets/icons_manager.dart';
import 'package:reckit_task/core/widgets/app_svg_image.dart';

class MoreOptionsButton extends StatelessWidget {
  const MoreOptionsButton({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).cardColor,
        radius: 16,
        child: AppSvgImage(assetName: IconsManager.horizontalDots),
      ),
    );
  }
}
