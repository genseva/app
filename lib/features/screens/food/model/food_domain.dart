class FoodDomain {
  final String name;
  final String image;
  final double price;
  final bool isVeg;
  final bool isCustomizable;
  int quantity = 0;
  double cartTotal = 0;

  FoodDomain(this.name, this.image, this.price, this.isVeg, this.isCustomizable);
}
