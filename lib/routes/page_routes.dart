import 'package:deligo/features/bottom_navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String bottomNavigation = 'bottom_navigation';

  Map<String, WidgetBuilder> routes() {
    return {
      bottomNavigation: (context) => BottomNavigation(),
    };
  }
}
