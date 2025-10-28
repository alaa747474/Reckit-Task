import 'package:flutter/material.dart';
import 'package:reckit_task/core/constants/app_sizes.dart';
import 'package:reckit_task/core/constants/app_strings.dart';
import 'package:reckit_task/core/constants/assets/icons_manager.dart';
import 'package:reckit_task/core/responsive/responsive_utils.dart';
import 'package:reckit_task/core/widgets/app_svg_image.dart';
import 'package:reckit_task/core/widgets/buttons/app_button.dart';

class ItemsHeaderRow extends StatelessWidget {
  const ItemsHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
       left: AppSizes.horizontalPadding,
        right: AppSizes.horizontalPadding,
        top: 32
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.items, style: theme.textTheme.headlineLarge),

          Row(
            children: [
              _buildFilterButton(theme),

            if(ResponsiveUtils.isDesktop(context)|| ResponsiveUtils.isTablet(context))...[  _buildVerticalDivider(theme),

              AppButton(
                icon: Icons.add,
                label: AppStrings.addItem,
                onPressed: () {},
              )],
            ],
          ),
        ],
      ),
    );
  }

  Container _buildVerticalDivider(ThemeData theme) {
    return Container(
      height: 48,
      width: 1,
      color: theme.dividerColor,
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }

  InkWell _buildFilterButton(ThemeData theme) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 24,
        backgroundColor: theme.cardColor,
        child: AppSvgImage(assetName: IconsManager.sliders),
      ),
    );
  }
}
