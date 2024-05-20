import 'package:deligo/features/account/ui/account_page.dart';
import 'package:deligo/features/account/ui/profile_page.dart';
import 'package:deligo/features/account/ui/saved_addresses_page.dart';
import 'package:deligo/features/account/ui/tnc_page.dart';
import 'package:deligo/features/bottom_navigation/bottom_navigation.dart';
import 'package:deligo/features/cab/ui/book_cab_page.dart';
import 'package:deligo/features/food/ui/checkout_page.dart';
import 'package:deligo/features/food/ui/order_food_screen.dart';
import 'package:deligo/features/food/ui/restaurant_profile_screen.dart';
import 'package:deligo/features/grocery/ui/grocery_store_screen.dart';
import 'package:deligo/features/grocery/ui/order_grocery_screen.dart';
import 'package:deligo/features/language/ui/language_page.dart';
import 'package:deligo/features/medicine/ui/order_medicine_screen.dart';
import 'package:deligo/features/parcel/ui/book_parcel_screen.dart';
import 'package:deligo/features/payment/ui/payment_page.dart';
import 'package:deligo/features/ride/ui/book_ride_screen.dart';
import 'package:deligo/features/shopping/ui/shopping_screen.dart';
import 'package:deligo/features/support/ui/support_page.dart';
import 'package:deligo/features/wallet/ui/wallet_page.dart';
import 'package:deligo/service/ui/book_service_screen.dart';
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
  static const String bookRideScreen = 'book_ride_screen';
  static const String bookCabScreen = 'book_cab_screen';
  static const String bookServiceScreen = 'book_service_screen';
  static const String bookParcelScreen = 'book_parcel_screen';
  static const String orderMedicineScreen = 'order_medicine_screen';
  static const String shoppingScreen = 'shopping_screen';
  static const String profilePage = 'profile_page';
  static const String languagePage = 'language_page';
  static const String savedAddressesPage = 'saved_addresses_page';
  static const String supportPage = 'support_page';
  static const String tncPage = 'tnc_page';

  Map<String, WidgetBuilder> routes() {
    return {
      bottomNavigation: (context) => const BottomNavigation(),
      orderFoodScreen: (context) => const OrderFoodScreen(),
      orderGroceryScreen: (context) => const OrderGroceryScreen(),
      groceryStoreScreen: (context) => const GroceryStoreScreen(),
      restaurantPage: (context) => const RestaurantProfilePage(),
      checkoutPage: (context) => const CheckoutPage(),
      paymentPage: (context) => const PaymentPage(),
      accountPage: (context) => const AccountPage(),
      walletPage: (context) => const WalletPage(),
      bookRideScreen: (context) => const BookRideScreen(),
      bookCabScreen: (context) => const BookCabScreen(),
      bookServiceScreen: (context) => const BookServiceScreen(),
      bookParcelScreen: (context) => const BookParcelScreen(),
      orderMedicineScreen: (context) => const OrderMedicineScreen(),
      shoppingScreen: (context) => const ShoppingScreen(),
      profilePage: (context) => const ProfilePage(),
      languagePage: (context) => const LanguagePage(),
      savedAddressesPage: (context) => const SavedAddressesPage(),
      supportPage: (context) => SupportPage(),
      tncPage: (context) => TncPage(),
    };
  }
}
