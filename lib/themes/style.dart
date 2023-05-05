import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    // primarySwatch: Colors.yellow,
    // primaryColor: Colors.yellow[400],
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.yellow,
      backgroundColor: Colors.black,
      accentColor: Colors.yellowAccent,
      cardColor: Colors.black,
      errorColor: Colors.red,
      brightness: Brightness.dark,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
