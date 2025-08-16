import '../features/account/ui/account_page.dart';
import '../features/account/ui/add_new_address_page.dart';
import '../features/account/ui/profile_page.dart';
import '../features/account/ui/saved_addresses_page.dart';
import '../features/account/ui/tnc_page.dart';
import '../features/bottom_navigation/bottom_navigation.dart';
import '../features/cab/ui/book_cab_page.dart';
import '../features/category/ui/sub_category_list.dart';
import '../features/common/ui/delivery_details_page.dart';
import '../features/common/ui/pickup_details_page.dart';
import '../features/common/ui/select_ride_page.dart';
import '../features/common/ui/set_destination_page.dart';
import '../features/common/ui/track_rider_page.dart';
import '../features/common/ui/where_to_page.dart';
import '../features/food/ui/checkout_page.dart';
import '../features/food/ui/order_food_screen.dart';
import '../features/food/ui/restaurant_profile_screen.dart';
import '../features/grocery/ui/grocery_category_screen.dart';
import '../features/grocery/ui/grocery_store_screen.dart';
import '../features/grocery/ui/order_grocery_screen.dart';
import '../features/language/ui/language_page.dart';
import '../features/medicine/ui/medicine_list.dart';
import '../features/medicine/ui/medicine_store_page.dart';
import '../features/medicine/ui/order_medicine_page.dart';
import '../features/order/ui/order_info_page.dart';
import '../features/parcel/ui/book_parcel_screen.dart';
import '../features/payment/ui/payment_page.dart';
import '../features/ride/ui/book_ride_screen.dart';
import '../features/service/ui/book_service_screen.dart';
import '../features/service/ui/provider_detail_screen.dart';
import '../features/service/ui/service_providers_screen.dart';
import '../features/service/ui/service_request_screen.dart';
import '../features/shopping/ui/product_info_page.dart';
import '../features/shopping/ui/shopping_page.dart';
import '../features/shopping/ui/shopping_products_screen.dart';
import '../features/support/ui/support_page.dart';
import '../features/wallet/ui/wallet_page.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String bottomNavigation = 'bottom_navigation';

  // food
  static const String orderFoodScreen = 'order_food';
  static const String restaurantPage = 'restaurant_page';

  //grocery
  static const String orderGroceryScreen = 'grocery_food';
  static const String groceryStoreScreen = 'grocery_store_screen';
  static const String groceryCategoryScreen = 'grocery_category_screen';

  //checkout
  static const String checkoutPage = 'checkout_page';
  static const String paymentPage = 'payment_page';
  static const String walletPage = 'wallet_page';

  //account
  static const String profilePage = 'profile_page';
  static const String languagePage = 'language_page';
  static const String savedAddressesPage = 'saved_addresses_page';
  static const String addNewAddressesPage = 'add_new_addresses_page';
  static const String supportPage = 'support_page';
  static const String accountPage = 'account_page';
  static const String subCategoryPage = 'sub_category_page';
  static const String tncPage = 'tnc_page';

  //delivery, cab, ride common
  static const String bookRideScreen = 'book_ride_screen';
  static const String bookCabScreen = 'book_cab_screen';
  static const String whereToPage = 'where_to_page';
  static const String selectRidePage = 'select_ride_page';
  static const String deliveryDetailsPage = 'delivery_details_page';
  static const String pickupDetailsPage = 'pickup_details_page';
  static const String setDestinationPage = 'set_destination_page';
  static const String trackRiderPage = 'track_rider_page';
  static const String bookParcelScreen = 'book_parcel_screen';

  //service
  static const String providerDetailsScreen = 'provider_details_Screen';
  static const String serviceRequestScreen = 'service_request_Screen';
  static const String serviceProviderScreen = 'service_provider_screen';
  static const String bookServiceScreen = 'book_service_screen';

  //medicine
  static const String orderMedicineScreen = 'order_medicine_screen';
  static const String medicineList = 'medicine_list';
  static const String medicineStorePage = 'medicine_store_page';

  //ecommerce
  static const String shoppingScreen = 'shopping_screen';
  static const String shoppingProductScreen = 'shopping_product_screen';
  static const String productInfoPage = 'product_info_page';

  //orders
  static const String orderInfoPage = 'order_info_page';

  Map<String, WidgetBuilder> routes() {
    return {
      bottomNavigation: (context) => const BottomNavigation(),
      orderFoodScreen: (context) => const OrderFoodScreen(),
      orderGroceryScreen: (context) => const OrderGroceryScreen(),
      groceryStoreScreen: (context) => const GroceryStoreScreen(),
      groceryCategoryScreen: (context) => const GroceryCategoryScreen(),
      restaurantPage: (context) => const RestaurantProfilePage(),
      checkoutPage: (context) => const CheckoutPage(),
      paymentPage: (context) => const PaymentPage(),
      accountPage: (context) => const AccountPage(),
      walletPage: (context) => const WalletPage(),
      bookRideScreen: (context) => const BookRideScreen(),
      bookCabScreen: (context) => const BookCabScreen(),
      bookServiceScreen: (context) => const BookServiceScreen(),
      bookParcelScreen: (context) => const BookParcelScreen(),
      orderMedicineScreen: (context) => const OrderMedicinePage(),
      shoppingScreen: (context) => const ShoppingPage(),
      shoppingProductScreen: (context) => const ShoppingProducts(),
      productInfoPage: (context) => const ProductInfoPage(),
      profilePage: (context) => const ProfilePage(),
      languagePage: (context) => const LanguagePage(),
      savedAddressesPage: (context) => const SavedAddressesPage(),
      addNewAddressesPage: (context) => const AddNewAddressPage(),
      supportPage: (context) => SupportPage(),
      tncPage: (context) => TncPage(),
      subCategoryPage: (context) => const SubCategoryList(),
      orderInfoPage: (context) => const OrderInfoPage(),
      whereToPage: (context) => const WhereToPage(),
      selectRidePage: (context) => const SelectRidePage(),
      trackRiderPage: (context) => const TrackRiderPage(),
      setDestinationPage: (context) => const SetDestinationPage(),
      serviceProviderScreen: (context) => const ServiceProvidersScreen(),
      providerDetailsScreen: (context) => const ProviderDetailScreen(),
      medicineList: (context) => const MedicineList(),
      medicineStorePage: (context) => const MedicineStorePage(),
      serviceRequestScreen: (context) => const ServiceRequestScreen(),
      deliveryDetailsPage: (context) => const DeliveryDetailsPage(),
      pickupDetailsPage: (context) => const PickupDetailsPage(),
    };
  }
}
