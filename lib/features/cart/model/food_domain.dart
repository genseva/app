class FoodDomain {
  final String name;
  final String image;
  final double price;
  final bool? isVeg;
  final bool? customizable;
  final int? cartQuantity;
  final String? unit;
  int quantity = 0;

  FoodDomain(
    this.name,
    this.image,
    this.price, {
    this.isVeg,
    this.customizable,
    this.cartQuantity,
    this.unit,
  });

  bool get isVegetarian => isVeg ?? true;

  bool get isCustomizable => customizable ?? false;
}
