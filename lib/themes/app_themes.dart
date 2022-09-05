// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
    ),
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
    ),
  ),
};
