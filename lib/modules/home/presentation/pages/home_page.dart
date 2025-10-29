import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reckit_task/core/constants/app_sizes.dart';
import 'package:reckit_task/core/di/service_locator.dart';
import 'package:reckit_task/core/widgets/app_nav_bar.dart';
import 'package:reckit_task/core/widgets/loading_indicator.dart';
import 'package:reckit_task/modules/home/presentation/widgets/items_header_row.dart';
import 'package:reckit_task/modules/trips/presentation/cubit/trips_cubit.dart';
import 'package:reckit_task/modules/trips/presentation/widgets/trip_grid_shimmer.dart';
import 'package:reckit_task/modules/trips/presentation/widgets/trips_grid_view.dart';

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
                  const SliverToBoxAdapter(child: ItemsHeaderRow()),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalPadding,
                      vertical: AppSizes.verticalPadding,
                    ),
                    sliver: TripsGridView(trips: state.trips),
                  ),
                ],
              );
            } else if (state is TripsLoading) {
              return TripGridShimmer();
            }

            return const Center(child: LoadingIndicator());
          },
        ),
      ),
    );
  }
}
