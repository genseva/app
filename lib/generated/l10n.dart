// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Hey mate`
  String get heyMate {
    return Intl.message(
      'Hey mate',
      name: 'heyMate',
      desc: '',
      args: [],
    );
  }

  /// `Sign in now`
  String get signInNow {
    return Intl.message(
      'Sign in now',
      name: 'signInNow',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue with`
  String get orContinueWith {
    return Intl.message(
      'Or Continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Sign up Now`
  String get signUpNow {
    return Intl.message(
      'Sign up Now',
      name: 'signUpNow',
      desc: '',
      args: [],
    );
  }

  /// `You're not registered yet`
  String get youAreNotRegistered {
    return Intl.message(
      'You\'re not registered yet',
      name: 'youAreNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Enter full name`
  String get enterFullName {
    return Intl.message(
      'Enter full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code sent on given number`
  String get enterVerificationCodeSent {
    return Intl.message(
      'Enter verification code sent on given number',
      name: 'enterVerificationCodeSent',
      desc: '',
      args: [],
    );
  }

  /// `Enter 4 digit OTP`
  String get enterOtp {
    return Intl.message(
      'Enter 4 digit OTP',
      name: 'enterOtp',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `min left`
  String get minLeft {
    return Intl.message(
      'min left',
      name: 'minLeft',
      desc: '',
      args: [],
    );
  }

  /// `RESEND`
  String get resend {
    return Intl.message(
      'RESEND',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `What are you looking for today?`
  String get whatAreYouLookingFor {
    return Intl.message(
      'What are you looking for today?',
      name: 'whatAreYouLookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Search item or store`
  String get searchItemOrStore {
    return Intl.message(
      'Search item or store',
      name: 'searchItemOrStore',
      desc: '',
      args: [],
    );
  }

  /// `Save extra while ordering`
  String get saveExtraWhileOrdering {
    return Intl.message(
      'Save extra while ordering',
      name: 'saveExtraWhileOrdering',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `RIDE`
  String get ride {
    return Intl.message(
      'RIDE',
      name: 'ride',
      desc: '',
      args: [],
    );
  }

  /// `CABS`
  String get cabs {
    return Intl.message(
      'CABS',
      name: 'cabs',
      desc: '',
      args: [],
    );
  }

  /// `FOOD`
  String get food {
    return Intl.message(
      'FOOD',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `GROCERY`
  String get grocery {
    return Intl.message(
      'GROCERY',
      name: 'grocery',
      desc: '',
      args: [],
    );
  }

  /// `MEDICINE`
  String get medicine {
    return Intl.message(
      'MEDICINE',
      name: 'medicine',
      desc: '',
      args: [],
    );
  }

  /// `PARCEL`
  String get parcel {
    return Intl.message(
      'PARCEL',
      name: 'parcel',
      desc: '',
      args: [],
    );
  }

  /// `SERVICE`
  String get service {
    return Intl.message(
      'SERVICE',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `SHOP`
  String get shop {
    return Intl.message(
      'SHOP',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Fast Foods`
  String get fastFoods {
    return Intl.message(
      'Fast Foods',
      name: 'fastFoods',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get chinese {
    return Intl.message(
      'Chinese',
      name: 'chinese',
      desc: '',
      args: [],
    );
  }

  /// `Sea Food`
  String get seaFood {
    return Intl.message(
      'Sea Food',
      name: 'seaFood',
      desc: '',
      args: [],
    );
  }

  /// `Dessert`
  String get dessert {
    return Intl.message(
      'Dessert',
      name: 'dessert',
      desc: '',
      args: [],
    );
  }

  /// `Near me`
  String get nearMe {
    return Intl.message(
      'Near me',
      name: 'nearMe',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Best Rated`
  String get bestRated {
    return Intl.message(
      'Best Rated',
      name: 'bestRated',
      desc: '',
      args: [],
    );
  }

  /// `Fast Delivery`
  String get fastDelivery {
    return Intl.message(
      'Fast Delivery',
      name: 'fastDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Veg Only`
  String get vegOnly {
    return Intl.message(
      'Veg Only',
      name: 'vegOnly',
      desc: '',
      args: [],
    );
  }

  /// `Fast Food, Beverages`
  String get fastFoodBeverages {
    return Intl.message(
      'Fast Food, Beverages',
      name: 'fastFoodBeverages',
      desc: '',
      args: [],
    );
  }

  /// `Chinese Foods, Italian Foods`
  String get chineseFoodsItalianFoods {
    return Intl.message(
      'Chinese Foods, Italian Foods',
      name: 'chineseFoodsItalianFoods',
      desc: '',
      args: [],
    );
  }

  /// `Order Foods`
  String get orderFoods {
    return Intl.message(
      'Order Foods',
      name: 'orderFoods',
      desc: '',
      args: [],
    );
  }

  /// `Food Near me`
  String get foodNearMe {
    return Intl.message(
      'Food Near me',
      name: 'foodNearMe',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants found`
  String get restaurantsFound {
    return Intl.message(
      'Restaurants found',
      name: 'restaurantsFound',
      desc: '',
      args: [],
    );
  }

  /// `Delivery in 20 mins`
  String get deliveryInMins {
    return Intl.message(
      'Delivery in 20 mins',
      name: 'deliveryInMins',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get km {
    return Intl.message(
      'km',
      name: 'km',
      desc: '',
      args: [],
    );
  }

  /// `Order Grocery`
  String get orderGrocery {
    return Intl.message(
      'Order Grocery',
      name: 'orderGrocery',
      desc: '',
      args: [],
    );
  }

  /// `Dairy`
  String get dairy {
    return Intl.message(
      'Dairy',
      name: 'dairy',
      desc: '',
      args: [],
    );
  }

  /// `Fruits`
  String get fruits {
    return Intl.message(
      'Fruits',
      name: 'fruits',
      desc: '',
      args: [],
    );
  }

  /// `Personal Care`
  String get personalCare {
    return Intl.message(
      'Personal Care',
      name: 'personalCare',
      desc: '',
      args: [],
    );
  }

  /// `Vegetable`
  String get vegetable {
    return Intl.message(
      'Vegetable',
      name: 'vegetable',
      desc: '',
      args: [],
    );
  }

  /// `Stores Found`
  String get StoresFound {
    return Intl.message(
      'Stores Found',
      name: 'StoresFound',
      desc: '',
      args: [],
    );
  }

  /// `Grocery Near Me`
  String get groceryNearMe {
    return Intl.message(
      'Grocery Near Me',
      name: 'groceryNearMe',
      desc: '',
      args: [],
    );
  }

  /// `Get Support`
  String get getSupport {
    return Intl.message(
      'Get Support',
      name: 'getSupport',
      desc: '',
      args: [],
    );
  }

  /// `Where to go?`
  String get whereToGo {
    return Intl.message(
      'Where to go?',
      name: 'whereToGo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
