import 'package:deligo/features/account/ui/account_page.dart';
import 'package:deligo/features/bottom_navigation/bottom_navigation.dart';
import 'package:deligo/features/food/ui/checkout_page.dart';
import 'package:deligo/features/food/ui/order_food_screen.dart';
import 'package:deligo/features/food/ui/restaurant_profile_screen.dart';
import 'package:deligo/features/grocery/ui/grocery_store_screen.dart';
import 'package:deligo/features/grocery/ui/order_grocery_screen.dart';
import 'package:deligo/features/payment/ui/payment_page.dart';
import 'package:deligo/features/ride/ui/book_ride_screen.dart';
import 'package:deligo/features/wallet/ui/wallet_page.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String bottomNavigation = 'bottom_navigation';
  static const String orderFoodScreen = 'order_food';
  static const String orderGroceryScreen = 'grocery_food';
  static const String groceryStoreScreen = 'grocery_store_screen';
  static const String restaurantPage = 'restaurant_page';
  static const String checkoutPage = 'checkout_page';
  static const String paymentPage = 'payment_page';
  static const String accountPage = 'account_page';
  static const String walletPage = 'wallet_page';
  static const String bookRidePage = 'book_ride_page';

  Map<String, WidgetBuilder> routes() {
    return {
      bottomNavigation: (context) => const BottomNavigation(),
      orderFoodScreen: (context) => const OrderFoodScreen(),
      orderGroceryScreen: (context) => const OrderGroceryScreen(),
      groceryStoreScreen: (context) => const GroceryStoreScreen(),
      restaurantPage: (context) => const RestaurantProfilePage(),
      checkoutPage: (context) => const CheckoutPage(),
      paymentPage: (context) => const PaymentPage(),
      walletPage: (context) => const WalletPage(),
      accountPage: (context) => const AccountPage(),
      bookRidePage: (context) => const BookRideScreen(),
    };
  }
}
