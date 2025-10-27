import 'package:reckit_task/modules/trips/data/datasources/trips_local_data_source.dart';
import 'package:reckit_task/modules/trips/data/repositories/trips_repository_impl.dart';
import 'package:reckit_task/modules/trips/domain/repositories/trips_repository.dart';

import '../../../modules/trips/domain/usecases/get_trips_usecase.dart';
import '../../../modules/trips/presentation/cubit/trips_cubit.dart';
import '../service_locator.dart';

void registerTripsDependencies() {
  /// DATA SOURCE
  sl.registerLazySingleton<TripsLocalDataSource>(
    () => TripsLocalDataSourceImpl(),
  );

  /// REPOSITORIES
  sl.registerLazySingleton<TripsRepository>(
    () => TripsRepositoryImpl(sl<TripsLocalDataSource>()),
  );

  /// USECASES
  sl.registerLazySingleton(() => GetTrips(sl<TripsRepository>()));

  /// CUBIT
  sl.registerLazySingleton(() => TripsCubit(getTripsUseCase: sl<GetTrips>()));
}
