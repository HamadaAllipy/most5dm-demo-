import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:most5dm/constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Helvetica',
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    overline: const TextStyle(
      fontSize: 28,
    ),
    headline6: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w200,
      color: const Color(0xFF4A4A4A).withOpacity(0.87),
    ),
    headline5: const TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 25,
      color: Color(0xFF000000),
    ),
    button: const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: TextStyle(
      color: const Color(0xFF1E1E1E).withOpacity(0.87),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: const TextStyle(
      color: Color(0xFF707070),
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      primary: const Color(0xff444444),
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColor.defaultColor,
    type: BottomNavigationBarType.fixed,
  ),
);
