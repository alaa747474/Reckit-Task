import 'package:dartz/dartz.dart';
import 'package:reckit_task/modules/trips/domain/entities/trip_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class TripsRepository {
   Future<Either<Failure, List<TripEntity>>> getTrips();
}