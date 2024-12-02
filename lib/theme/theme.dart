import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
    primary: Colors.teal,
    primaryContainer: Colors.teal[100]!,
    onPrimary: Colors.black,
    secondary: Colors.teal,
    surface: Colors.white,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.teal,
    brightness: Brightness.dark,
  ).copyWith(
    primary: Colors.teal,
    primaryContainer: Colors.teal[800]!,
    onPrimary: Colors.white,
    secondary: Colors.teal[300],
    surface: Colors.black,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
  ),
);
