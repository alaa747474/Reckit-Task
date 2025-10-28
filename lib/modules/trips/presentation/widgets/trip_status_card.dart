import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';
import 'package:reckit_task/core/constants/assets/icons_manager.dart';
import 'package:reckit_task/core/extensions/size_extentions.dart';
import 'package:reckit_task/core/widgets/app_svg_image.dart';

class TripStatusCard extends StatelessWidget {
  final String title;

  const TripStatusCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).extension<CustomColors>()?.statusCardColor?.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Theme.of(context).extension<CustomColors>()!.statusCardColor!,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(width: 8.h,),
          AppSvgImage(assetName: IconsManager.downArrow,)
        ],
      ),
    );
  }
}
