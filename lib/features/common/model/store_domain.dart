import 'package:deligo/generated/assets.dart';

class StoreDomain {
  final String image;
  final String name;
  final String location;
  final String deliveryTime;
  final double distance;
  final String timing;
  final String? rating;
  final double? serviceCharge;
  final String? type;

  StoreDomain(this.image, this.name, this.location, this.deliveryTime, this.distance, this.timing,
      this.type,
      {this.serviceCharge, this.rating});

  static final List<StoreDomain> foodList = [
    StoreDomain(
      Assets.foodRestaurantFood1,
      'Monte Carlo Restaurant',
      'CentralPark',
      '20',
      1.5,
      'fastFoodBeverages',
      "food",
      rating: '4.5',
    ),
    StoreDomain(
      Assets.foodRestaurantFood2,
      'Hotel China Town',
      'Food Park',
      '30',
      4.5,
      'chineseFoodsItalianFoods',
      "food",
      rating: '3.5',
    ),
    StoreDomain(
      Assets.foodRestaurantFood3,
      'Auli Restaurant',
      'CentralPark',
      '25',
      2.5,
      'fastFoodBeverages',
      "food",
      rating: '5',
    ),
    StoreDomain(
      Assets.foodRestaurantFood1,
      'Monte Carlo Store',
      'CentralPark',
      '10',
      0.5,
      'fastFoodBeverages',
      "food",
      rating: '4.5',
    ),
    StoreDomain(
      Assets.foodRestaurantFood2,
      'Hotel China Town',
      'Food Park',
      '20',
      1.5,
      'chineseFoodsItalianFoods',
      "food",
      rating: '2.5',
    ),
    StoreDomain(
      Assets.foodRestaurantFood3,
      'Auli Store',
      'CentralPark',
      '23',
      4.5,
      'fastFoodBeverages',
      "food",
      rating: '3.5',
    ),
  ];

  static final List<StoreDomain> groceryList = [
    StoreDomain(
      Assets.groceryStore1,
      'Megamart 24x7',
      'CentralPark',
      '20',
      1.5,
      '24x7 Open',
      "grocery",
    ),
    StoreDomain(
      Assets.groceryStore2,
      'Citylime Store',
      'Food Park',
      '30',
      4.5,
      '08:00 am to 10:00 pm',
      "grocery",
    ),
    StoreDomain(
      Assets.groceryStore3,
      'Delight Grocery Store',
      'CentralPark',
      '25',
      2.5,
      '09:00 am to 09:00 pm',
      "grocery",
    ),
    StoreDomain(
      Assets.groceryStore1,
      'Monte Carlo Store',
      'CentralPark',
      '10',
      0.5,
      '24x7 Open',
      "grocery",
    ),
    StoreDomain(
      Assets.groceryStore2,
      'Hotel China Town',
      'Food Park',
      '20',
      1.5,
      '08:30 am to 11:00 pm',
      "grocery",
    ),
    StoreDomain(
      Assets.groceryStore3,
      'Auli Store',
      'CentralPark',
      '23',
      4.5,
      '08:00 am to 10:00 pm',
      "grocery",
    ),
  ];

  static final List<StoreDomain> medicineList = [
    StoreDomain(
      Assets.storeStore1,
      'Healthcure Pharma',
      'CentralPark',
      '20',
      1.5,
      'Open 24 hours',
      "medicine",
    ),
    StoreDomain(
      Assets.storeStpre2,
      'Medicare Store',
      'Jamestown, New York',
      '22',
      3.8,
      '08:00 am to 10:00 pm',
      "medicine",
    ),
  ];

  static final List<StoreDomain> ecommerce = [
    StoreDomain(
      Assets.productsStore,
      "WStore",
      "1141 Central Park, Hemilton",
      "5 days 30",
      0,
      "Open",
      "shop",
    ),
  ];

  static final List<StoreDomain> serviceList = [
    StoreDomain(
      Assets.profilesPlumber1,
      'Olivia Blanton',
      'CentralPark',
      '20',
      1.5,
      '148 Jobs',
      "service",
      serviceCharge: 20.00,
    ),
    StoreDomain(
      Assets.profilesPlumber2,
      'Jane Doe',
      'Jamestown, New York',
      '22',
      3.8,
      '108 Jobs',
      "service",
      serviceCharge: 20.00,
    ),
    StoreDomain(
      Assets.profilesPlumber3,
      'Joe Brooks',
      'CentralPark',
      '20',
      1.5,
      '278 Jobs',
      "service",
      serviceCharge: 24.00,
    ),
    StoreDomain(
      Assets.profilesPlumber4,
      'Mat White',
      'Jamestown, New York',
      '22',
      3.8,
      '58 Jobs',
      "service",
      serviceCharge: 10.00,
    ),
    StoreDomain(
      Assets.profilesPlumber5,
      'Caldwell Simpson',
      'Jamestown, New York',
      '22',
      3.8,
      '143 Jobs',
      "service",
      serviceCharge: 18.00,
    ),
  ];
}
