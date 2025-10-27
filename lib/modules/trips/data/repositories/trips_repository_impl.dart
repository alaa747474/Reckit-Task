
import 'package:dartz/dartz.dart';
import 'package:reckit_task/core/errors/failures.dart';

import '../../domain/entities/trip_entity.dart';
import '../../domain/repositories/trips_repository.dart';
import '../datasources/trips_local_data_source.dart';
import '../mappers/trip_mapper.dart';

class TripsRepositoryImpl implements TripsRepository {
  final TripsLocalDataSource localDataSource;

  TripsRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<TripEntity>>> getTrips() async{
    try {
      final result = await localDataSource.getTrips();
      final entities = result.map((model) => TripMapper.toEntity(model)).toList();
      return Right(entities);
    } catch (e) {
      return Left(LocalDataFailure('Failed to load trips: $e'));
    }
  }

 
}