import 'package:dartz/dartz.dart';
import 'package:reckit_task/core/errors/failures.dart';

import '../entities/trip_entity.dart';
import '../repositories/trips_repository.dart';

class GetTrips {
  final TripsRepository repository;

  GetTrips(this.repository);

  Future<Either<Failure, List<TripEntity>>> call() async =>
      await repository.getTrips();
}
