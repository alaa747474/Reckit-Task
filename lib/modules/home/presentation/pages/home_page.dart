import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reckit_task/core/di/service_locator.dart';
import 'package:reckit_task/core/responsive/responsive_layout.dart';
import 'package:reckit_task/modules/trips/presentation/cubit/trips_cubit.dart';
import 'package:reckit_task/modules/trips/presentation/widgets/trip_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TripsCubit>()..getTrips(),
      child: Scaffold(
        body: ResponsiveLayout(
          mobile: BlocBuilder<TripsCubit, TripsState>(
            builder: (context, state) {
              if (state is TripsLoaded) {
                return ListView.builder(
                  itemCount: state.trips.length,
                  itemBuilder: (context, index) {
                    final trip = state.trips[index];
                    return TripCard(trip: trip);
                  },
                );
              }
              return Text("adsafnlasjknakl");
            },
          ),
          tablet: SizedBox(),
          desktop: BlocBuilder<TripsCubit, TripsState>(
            builder: (context, state) {
              if (state is TripsLoaded) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: state.trips.length,
                  itemBuilder: (context, index) {
                    final trip = state.trips[index];
                    return TripCard(trip: trip);
                  },
                 
                );
              }
              return Text("adsafnlasjknakl");
            },
          ),
        ),
      ),
    );
  }
}
