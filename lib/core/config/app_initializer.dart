import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reckit_task/core/di/service_locator.dart';

import '../observers/app_bloc_observer.dart';

class AppInitializer {
  AppInitializer._();

  static final AppInitializer _instance = AppInitializer._();

  factory AppInitializer() {
    return _instance;
  }

  Future<void> init() async {
    // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await initServiceLocator();

    Bloc.observer = AppBlocObserver();
  }
}
