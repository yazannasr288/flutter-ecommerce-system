import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeDataEnglish = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "PlayfairDisplay",
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: AppColor.black),
    titleTextStyle: TextStyle(
      fontFamily: "PlayfairDisplay",

      color: AppColor.primaryColor,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.grey[50],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),

  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: AppColor.grey,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: AppColor.black,
    ),
    bodySmall: TextStyle(fontSize: 17, height: 2, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.0,
      wordSpacing: 0.0,
      height: null,
      decoration: TextDecoration.none,
      overflow: TextOverflow.clip,
    ),
  ),
);

ThemeData themeDataArabic = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Cairo",
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: AppColor.black),
    titleTextStyle: TextStyle(
      fontFamily: "Cairo",

      color: AppColor.primaryColor,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.grey[50],
  ),  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
  ),

  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: AppColor.grey,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: AppColor.black,
    ),
    bodySmall: TextStyle(fontSize: 17, height: 2, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.0,
      wordSpacing: 0.0,
      height: null,
      decoration: TextDecoration.none,
      overflow: TextOverflow.clip,
    ),
  ),
);
