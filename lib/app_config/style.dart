import 'package:deligo/app_config/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'ProductSans',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: mainColor,
  primaryColorDark: blackColor,

  ///bottom bar theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: mainColor,
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
    titleTextStyle: TextStyle(fontFamily: 'ProductSans', color: Colors.black),
  ),

  ///text theme
  textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
          headline6: TextStyle(),
          headline5: TextStyle(),
          caption: TextStyle(fontSize: 15),
          button: TextStyle())
      .apply(bodyColor: Colors.black),
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
