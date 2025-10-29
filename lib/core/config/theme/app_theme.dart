import 'package:flutter/material.dart';
import 'package:reckit_task/core/config/theme/custom_colors.dart';
import 'package:reckit_task/core/extensions/size_extentions.dart';

class AppTheme {
  AppTheme._();



  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
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
        headlineLarge: TextStyle(color: Colors.white, fontSize: 32.sp,overflow: TextOverflow.ellipsis,),
        bodyLarge: TextStyle(color: Colors.white, fontSize: 18.sp,overflow: TextOverflow.ellipsis,),
        bodyMedium: TextStyle(color: Colors.white, fontSize: 14.sp,overflow:TextOverflow.ellipsis),
        bodySmall: TextStyle(color: Color(0xFF999999), fontSize: 12,overflow: TextOverflow.ellipsis,),
      ),
    );
  }
}
