import 'package:deligo/app_config/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'ProductSans',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: mainColor,
  primaryColorDark: blackColor,
  cardColor: cardColor,
  hintColor: greyTextColor,
  disabledColor: const Color(0xffF4F7F9),

  textSelectionTheme: TextSelectionThemeData(cursorColor: mainColor),

  ///bottom bar theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: mainColor,
    backgroundColor: Colors.transparent,
    selectedLabelStyle: TextStyle(
      color: blackColor,
      fontSize: 10,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 10,
    ),
    unselectedItemColor: const Color(0xffc0c5c1),
  ),

  ///appBar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontFamily: 'ProductSans',
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  ///text theme
  textTheme: const TextTheme(
    headlineSmall: TextStyle(fontWeight: FontWeight.bold),
  ).apply(bodyColor: Colors.black),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
