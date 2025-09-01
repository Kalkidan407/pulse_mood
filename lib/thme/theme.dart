
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
   colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      brightness: Brightness.light,
    ).copyWith(
      background: Colors.white, // scaffold background
      onBackground: Colors.black, // text on background
    ),
   // primarySwatch: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black)
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      brightness: Brightness.dark,
    ).copyWith(
      background: Colors.black, // scaffold background in dark mode
      onBackground: Colors.white,
    ),
   // primarySwatch: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
       iconTheme: IconThemeData(color: Colors.black)
    ),
  );
}
