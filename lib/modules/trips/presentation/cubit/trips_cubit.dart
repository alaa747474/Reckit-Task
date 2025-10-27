import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reckit_task/modules/trips/domain/entities/trip_entity.dart';

import '../../domain/usecases/get_trips_usecase.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  final GetTrips getTripsUseCase;

  TripsCubit({required this.getTripsUseCase}) : super(TripsInitial());

  Future<void> getTrips() async {
    emit(TripsLoading());
    final result = await getTripsUseCase();
    result.fold(
      (failure) => emit(TripsError(message: failure.message)),
      (trips) => emit(TripsLoaded(trips: trips)),
    );
  }
}
