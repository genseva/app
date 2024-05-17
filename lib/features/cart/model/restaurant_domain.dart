import 'package:deligo/generated/assets.dart';

class RestaurantDomain {
  final String image;
  final String name;
  final String location;
  final String foodType;

  RestaurantDomain(this.image, this.name, this.location, this.foodType);

  static final List<RestaurantDomain> list = [
    RestaurantDomain(
      Assets.foodRestaurantFood1,
      'Monte Carlo Restaurant',
      'CentralPark',
      "fastFoodBeverages",
    ),
    RestaurantDomain(
      Assets.foodRestaurantFood2,
      'Hotel China Town',
      'Food Park',
      "chineseFoodsItalianFoods",
    ),
    RestaurantDomain(
      Assets.foodRestaurantFood3,
      'Auli Restaurant',
      'CentralPark',
      "fastFoodBeverages",
    ),
    RestaurantDomain(
      Assets.foodRestaurantFood1,
      'Monte Carlo Restaurant',
      'CentralPark',
      "fastFoodBeverages",
    ),
    RestaurantDomain(
      Assets.foodRestaurantFood2,
      'Hotel China Town',
      'Food Park',
      "chineseFoodsItalianFoods",
    ),
    RestaurantDomain(
      Assets.foodRestaurantFood3,
      'Auli Restaurant',
      'CentralPark',
      "fastFoodBeverages",
    ),
  ];
}
