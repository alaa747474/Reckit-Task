import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';
import 'package:reckit_task/core/constants/app_sizes.dart';
import 'package:reckit_task/core/constants/app_strings.dart';
import 'package:reckit_task/core/constants/assets/icons_manager.dart';
import 'package:reckit_task/core/extensions/size_extentions.dart';
import 'package:reckit_task/core/responsive/responsive_utils.dart';
import 'package:reckit_task/core/widgets/app_svg_image.dart';

class AppNavBar extends StatefulWidget implements PreferredSizeWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _AppNavBarState extends State<AppNavBar> {
  int selectedIndex = 0;

  final List<String> items = [
    AppStrings.items,
    AppStrings.pricing,
    AppStrings.info,
    AppStrings.tasks,
    AppStrings.analytics,
  ];

  final List<GlobalKey> _itemKeys = [];

  double _indicatorLeft = 0;
  double _indicatorWidth = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < items.length; i++) {
      _itemKeys.add(GlobalKey());
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateIndicator();
    });
  }

  void _updateIndicator() {
    if (!mounted) return;

    final key = _itemKeys[selectedIndex];
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox != null && mounted) {
      final position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        _indicatorLeft = position.dx;
        _indicatorWidth = renderBox.size.width;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateIndicator();
    });

    return Container(
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalPadding,
              vertical: 12,
            ),
            child: Row(
              children: [
                if (ResponsiveUtils.isMobile(context) ||
                    ResponsiveUtils.isTablet(context)) ...[
                  AppSvgImage(assetName: IconsManager.menu),
                  SizedBox(width: 12),
                ],

                // Logo
                AppSvgImage(assetName: IconsManager.logo),
                const Spacer(),

                // Navigation items
                if (ResponsiveUtils.isDesktop(context))
                  ...List.generate(items.length, (index) {
                    final bool isSelected = selectedIndex == index;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        key: _itemKeys[index],
                        onTap: () {
                          setState(() => selectedIndex = index);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text(
                          items[index],
                          style: TextStyle(
                            color: isSelected
                                ? Theme.of(
                                    context,
                                  ).extension<CustomColors>()?.selectedColor
                                : Theme.of(
                                    context,
                                  ).extension<CustomColors>()?.unselectedColor,
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }),

                AppSvgImage(assetName: IconsManager.setting),
                const SizedBox(width: 16),
                AppSvgImage(assetName: IconsManager.notification),
                const SizedBox(width: 24),

                Container(width: 1, height: 24, color: Colors.grey[800]),
                const SizedBox(width: 24),

                Row(
                  children: [
                    const CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Picture_with_Mbapp%C3%A9_%28cropped%29.jpg/250px-Picture_with_Mbapp%C3%A9_%28cropped%29.jpg',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Alaa Reda',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 8),
                    AppSvgImage(
                      assetName: IconsManager.downArrow,
                      width: 8.h,
                      height: 8.h,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom divider with moving indicator
          if (ResponsiveUtils.isDesktop(context))
            Stack(
              children: [
                Container(height: 1, color: Theme.of(context).dividerColor),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  left: _indicatorLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: 1,
                    width: _indicatorWidth,
                    color: Theme.of(
                      context,
                    ).extension<CustomColors>()?.warningColor,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
