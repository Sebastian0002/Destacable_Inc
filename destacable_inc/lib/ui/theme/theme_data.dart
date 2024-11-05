import 'package:flutter/material.dart';

class ThemeDataCustom {

  static ThemeData customData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,  // Regular weight
            fontSize: 18.0,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w300,  // Light weight
            fontSize: 16.0,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w200,  // Light weight
            fontSize: 14.0,
          ),
          displayLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,  // Bold weight
            fontSize: 34.0,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w800,  // Bold weight
            fontSize: 28.0,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,  // Bold weight
            fontSize: 24.0,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,  // Bold weight
            fontSize: 32.0,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,  // SemiBold weight
            fontSize: 24.0,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,  // Medium weight
            fontSize: 20.0,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,  // Regular weight
            fontSize: 18.0,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,  // Medium weight
            fontSize: 16.0,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w300,  // Light weight
            fontSize: 14.0,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,  // Bold weight
            fontSize: 22.0,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,  // SemiBold weight
            fontSize: 20.0,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,  // Regular weight
            fontSize: 18.0,
          ),
        ),

  );

}