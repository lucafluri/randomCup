import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    // primarySwatch: Colors.yellow,
    primaryColor: Colors.yellow[400],
    // colorScheme: secondary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
