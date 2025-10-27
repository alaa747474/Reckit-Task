part of 'trips_cubit.dart';

abstract class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object> get props => [];
}

class TripsInitial extends TripsState {}

class TripsLoading extends TripsState {}

class TripsLoaded extends TripsState {
  final List<TripEntity> trips;

  const TripsLoaded({required this.trips});

  @override
  List<Object> get props => [trips];
}

class TripsError extends TripsState {
  final String message;

  const TripsError({required this.message});

  @override
  List<Object> get props => [message];
}