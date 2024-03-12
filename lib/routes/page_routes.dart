import 'package:deligo/features/bottom_navigation/bottom_navigation.dart';
import 'package:deligo/features/screens/food/order_food_screen.dart';
import 'package:deligo/features/screens/grocery/order_grocery_screen.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String bottomNavigation = 'bottom_navigation';
  static const String orderFoodScreen = 'order_food';
  static const String orderGroceryScreen = 'grocery_food';

  Map<String, WidgetBuilder> routes() {
    return {
      bottomNavigation: (context) => const BottomNavigation(),
      orderFoodScreen: (context) => const OrderFoodScreen(),
      orderGroceryScreen: (context) => const OrderGroceryScreen(),
    };
  }
}
