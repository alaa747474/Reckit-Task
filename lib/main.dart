import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/app_initializer.dart';
import 'package:reckit_task/core/config/theme/app_theme.dart';
import 'package:reckit_task/core/constants/app_strings.dart';
import 'package:reckit_task/modules/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer().init();
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: AppStrings.appName,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}
