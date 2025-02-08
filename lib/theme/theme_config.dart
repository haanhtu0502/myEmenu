import 'package:flutter/material.dart';

class ThemeConfig {
  static Color primaryColor = Colors.lightBlue;
  static Color secondaryColor = const Color(0xFFFF6F2C);
  static Color hintColor = const Color(0xFF646982);
  static Color redColor = const Color(0xFFE01E1E);
  static Color greenColor = const Color(0xFF00B14F);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    hintColor: hintColor,
    secondaryHeaderColor: secondaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
    textSelectionTheme: TextSelectionThemeData(cursorColor: hintColor),
  );

  static ThemeData darkTheme = ThemeData(
    toggleableActiveColor: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
  );
}
