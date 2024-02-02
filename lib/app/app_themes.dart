import 'package:flutter/material.dart';
import 'package:project_iot/app/app_helper.dart';

class AppThemes{
  static ThemeData darkTheme = ThemeData(
    // useMaterial3: true,

    primaryColor: AppHelpers.primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: AppHelpers.darkPrimaryColor,
      cardColor: const Color(0xFF101C35),
      accentColor: const Color(0xFF07C4FB),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor:  Color(0xFF07C4FB),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppHelpers.darkFillColor,
      hintStyle: TextStyle(
        color: AppHelpers.grey400,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color:  AppHelpers.darkTextColor,
      )
    ),
  );
  static ThemeData lightTheme = ThemeData(
    // useMaterial3: true,

    primaryColor: AppHelpers.lightSecondaryColor,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: AppHelpers.lightBackgroundColor,
      cardColor: const Color(0xFFEAEFFA),
    ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppHelpers.primaryColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppHelpers.lightFillColor,
      ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 16,
          color:  AppHelpers.lightTextColor,
        )
    ),
  );

}