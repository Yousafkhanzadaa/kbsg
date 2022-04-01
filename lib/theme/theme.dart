import 'package:flutter/material.dart';

class CustomTheme {
  // Custom ColorScheme....
  ColorScheme colorScheme = const ColorScheme(
    secondary: Color(0xFF187E9E),
    background: Colors.white,
    brightness: Brightness.light,
    error: Colors.redAccent,
    onBackground: Colors.white,
    onError: Color(0xFFFF0000),
    onPrimary: Color(0xFF32B768),
    onSecondary: Color(0xFF187E9E),
    primary: Color(0xFF32B768),
    onSurface: Colors.white,
    surface: Colors.white,
    primaryVariant: Color(0xFF32B768),
    secondaryVariant: Color(0xFF32B768),
  );

  // Custom TextTheme..........
  TextTheme textTheme = const TextTheme(
    // user for main headings
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Color(0xFF1F2937),
    ),

    // user for recommended cards
    headline2: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Color(0xFF1F2937),
    ),

    // Text after main welcome heading
    // use as a login and create account
    headline4: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF89909E),
    ),

    // use on TextFormFields and more
    headline5: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFF374151),
    ),

    // Use of user name in profile screen
    subtitle1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFF4B5563),
    ),

    subtitle2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color(0xFF4B5563),
    ),

    // use as a universal body text
    bodyText1: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color(0xFF4B5563),
    ),
  );
}
