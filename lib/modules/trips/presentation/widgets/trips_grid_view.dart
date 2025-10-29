import 'package:flutter/material.dart';
import 'package:reckit_task/modules/trips/domain/entities/trip_entity.dart';
import 'package:reckit_task/modules/trips/presentation/widgets/trip_card.dart';

class TripsGridView extends StatelessWidget {
  const TripsGridView({super.key, required this.trips});
  final List<TripEntity> trips;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (MediaQuery.of(context).size.width ~/ 270).toInt(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: _getAspectRatio(context),
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final trip = trips[index];
        // Animate each card on build
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
      }, childCount: trips.length),
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
