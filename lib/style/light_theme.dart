import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:most5dm/constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme:  const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),

  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    overline: TextStyle(
      fontSize: 28,
    ),
    headline6: TextStyle(
      fontFamily: 'Tajawal',
      color: Colors.black
    ),
    headline5: TextStyle(
      fontFamily: 'Tajawal',
      fontSize: 18,
    ),
    button: TextStyle(
      color: Colors.white,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      primary: AppColor.defaultColor,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColor.defaultColor,
    type: BottomNavigationBarType.fixed,
  ),
);

