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

        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (MediaQuery.of(context).size.width ~/ 270).toInt(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: _getAspectRatio(width,(MediaQuery.of(context).size.width ~/ 270).toInt()),
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final trip = trips[index];
            return _AnimatedTripCard(
              key: ValueKey('trip_${trip.id}'),
              trip: trip,
              index: index,
            );
          }, childCount: trips.length),
        );
      },
    );
  }

  double _getAspectRatio(double width, int crossAxisCount) {
    final itemWidth = (width - (16 * (crossAxisCount - 1))) / crossAxisCount;
    const itemHeight = 340;
    return itemWidth / itemHeight;
  }
}

class _AnimatedTripCard extends StatelessWidget {
  const _AnimatedTripCard({super.key, required this.trip, required this.index});

  final TripEntity trip;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
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
  }
}
