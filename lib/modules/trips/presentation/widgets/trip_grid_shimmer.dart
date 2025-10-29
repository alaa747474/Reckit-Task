import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:reckit_task/core/constants/app_sizes.dart';
import 'package:reckit_task/modules/home/presentation/widgets/items_header_row.dart';

class TripGridShimmer extends StatelessWidget {
  const TripGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = (MediaQuery.of(context).size.width ~/ 270).toInt();

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ItemsHeaderRow()),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalPadding,
            vertical: AppSizes.verticalPadding,
          ),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: _getAspectRatio(context),
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _TripCardShimmer();
              },
              childCount: 6,
            ),
          ),
        ),
      ],
    );
  }

  double _getAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width ~/ 270).toInt();
    const itemHeight = 380;
    final itemWidth = width / crossAxisCount;
    return itemWidth / itemHeight;
  }
}

class _TripCardShimmer extends StatelessWidget {
  const _TripCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).dividerColor,
      highlightColor:  Theme.of(context).dividerColor.withValues(alpha: (0.5)),
      child: Container(
        height: 380,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusSmall),
        ),
        padding: const EdgeInsets.all(12),
        
      ),
    );
  }
}
