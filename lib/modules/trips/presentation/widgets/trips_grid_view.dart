import 'package:flutter/material.dart';
import 'package:reckit_task/modules/trips/domain/entities/trip_entity.dart';
import 'package:reckit_task/modules/trips/presentation/widgets/trip_card.dart';

class TripsGridView extends StatelessWidget {
  const TripsGridView({super.key, required this.trips});
  final List<TripEntity> trips;
  
  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.crossAxisExtent;
        final crossAxisCount = _getCrossAxisCount(width);
        
        // Use width as key to force rebuild on resize
        return SliverGrid(
          key: ValueKey('grid_$width'),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: _getAspectRatio(width, crossAxisCount),
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final trip = trips[index];
              return TweenAnimationBuilder<double>(
                key: ValueKey('trip_${trip.id}_$width'),
                tween: Tween(begin: 0, end: 1),
                duration: Duration(milliseconds: 300 + (index * 100)),
                curve: Curves.easeInExpo,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 30 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: TripCard(trip: trip),
              );
            },
            childCount: trips.length,
          ),
        );
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width >= 1200) return 5;
    if (width >= 900) return 3;
    if (width >= 600) return 2;
    return 1;
  }

  double _getAspectRatio(double width, int crossAxisCount) {
    final itemWidth = (width - (16 * (crossAxisCount - 1))) / crossAxisCount;
    const itemHeight = 340;
    return itemWidth / itemHeight;
  }
}