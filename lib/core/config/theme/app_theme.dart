import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';
import 'package:reckit_task/core/extensions/size_extentions.dart';

class AppTheme {
  // Prevent instantiation
  AppTheme._();

  /// Get light theme
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: "Inter",
      useMaterial3: true,
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      cardColor: const Color(0xFFF5F5F5),
      extensions: const [CustomColors.dark],

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF0A3B5C),
        elevation: 0,
      ),

      textTheme:  TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 18.sp,overflow: TextOverflow.ellipsis),
        bodySmall: TextStyle(color: Colors.grey, fontSize: 12.sp,overflow:TextOverflow.ellipsis),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      cardColor: const Color(0xFF171717),
      extensions: const [CustomColors.dark],
      dividerColor: Color(0xFF262626),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Color(0xFFD1EAFA),
        elevation: 0,
      ),

      // Text theme
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 18.sp,overflow: TextOverflow.ellipsis,),
        bodySmall: TextStyle(color: Colors.grey, fontSize: 12,overflow: TextOverflow.ellipsis,),
      ),
    );
  }
}
