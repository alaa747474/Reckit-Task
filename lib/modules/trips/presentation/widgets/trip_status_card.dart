import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';
import 'package:reckit_task/core/extensions/size_extentions.dart';

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

          Icon(Icons.arrow_drop_down, color: Colors.white, size: 22.r),
        ],
      ),
    );
  }
}
