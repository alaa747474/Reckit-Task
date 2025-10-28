import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reckit_task/core/constants/app_sizes.dart';
import 'package:reckit_task/core/di/service_locator.dart';
import 'package:reckit_task/core/widgets/app_nav_bar.dart';
import 'package:reckit_task/modules/home/presentation/widgets/items_header_row.dart';
import 'package:reckit_task/modules/trips/presentation/cubit/trips_cubit.dart';
import 'package:reckit_task/modules/trips/presentation/widgets/trip_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TripsCubit>()..getTrips(),
      child: Scaffold(
        appBar: AppNavBar(),
        body: BlocBuilder<TripsCubit, TripsState>(
          builder: (context, state) {
            if (state is TripsLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: ItemsHeaderRow()),

                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalPadding,
                      vertical: AppSizes.verticalPadding,
                    ),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (MediaQuery.of(context).size.width ~/ 270).toInt(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: _getAspectRatio(context),
                      ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final trip = state.trips[index];
                        return TripCard(trip: trip);
                      }, childCount: state.trips.length),
                    ),
                  ),
                ],
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  double _getAspectRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width ~/ 270).toInt();
    const itemHeight = 360;
    final itemWidth = width / crossAxisCount;
    return itemWidth / itemHeight;
  }
}
