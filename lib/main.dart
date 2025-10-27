import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/app_initializer.dart';
import 'package:reckit_task/core/theme/app_theme.dart';
import 'package:reckit_task/modules/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await AppInitializer().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: AppTheme.getTheme(context),
       home:  HomePage(),
    );
  }
}


