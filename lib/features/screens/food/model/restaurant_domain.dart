class RestaurantDomain {
  final String image;
  final String name;
  final String location;
  final String foodType;

  static final List<RestaurantDomain> restaurantList = [
    RestaurantDomain('assets/food/restaurant_food1.png',
        'Monte Carlo Restaurant', 'CentralPark', "fastFoodBeverages"),
    RestaurantDomain('assets/food/restaurant_food2.png', 'Hotel China Town',
        'Food Park', "chineseFoodsItalianFoods"),
    RestaurantDomain('assets/food/restaurant_food3.png', 'Auli Restaurant',
        'CentralPark', "fastFoodBeverages"),
    RestaurantDomain('assets/food/restaurant_food1.png',
        'Monte Carlo Restaurant', 'CentralPark', "fastFoodBeverages"),
    RestaurantDomain('assets/food/restaurant_food2.png', 'Hotel China Town',
        'Food Park', "chineseFoodsItalianFoods"),
    RestaurantDomain('assets/food/restaurant_food3.png', 'Auli Restaurant',
        'CentralPark', "fastFoodBeverages"),
  ];

  RestaurantDomain(this.image, this.name, this.location, this.foodType);
}
