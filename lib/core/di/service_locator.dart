import 'package:get_it/get_it.dart';
import 'package:reckit_task/core/di/dependencies/trips_dependencies.dart';

GetIt sl = GetIt.instance;
Future<void> initServiceLocator() async {
  registerTripsDependencies();
}