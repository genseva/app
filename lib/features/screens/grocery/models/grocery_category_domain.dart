import 'package:deligo/features/screens/grocery/models/grocery_domain.dart';
import 'package:deligo/generated/assets.dart';

class GroceryCategoryDomain {
  final String title;
  final List<GroceryDomain> items;

  GroceryCategoryDomain({required this.title, required this.items});

  static final List<GroceryCategoryDomain> groceryList = [
    GroceryCategoryDomain(title: "Vegetable", items: [
      GroceryDomain(
          name: "Fresh Potatoes",
          image: Assets.itemsVegPotatoes,
          quantity: "500g",
          price: 5.00),
      GroceryDomain(
          name: "Fresh Broccoli",
          image: Assets.itemsVegCouli,
          quantity: "500g",
          price: 5.00),
      GroceryDomain(
          name: "Fresh Capsicum",
          image: Assets.itemsVegCapsicum,
          quantity: "500g",
          price: 6.00),
      GroceryDomain(
          name: "Fresh Eggplant",
          image: Assets.itemsVegBringle,
          quantity: "500g",
          price: 9.00),
      GroceryDomain(
          name: "Cauliflower",
          image: Assets.itemsVegColiflower,
          quantity: "1000g",
          price: 7.00),
      GroceryDomain(
          name: "Onion",
          image: Assets.itemsVegOnion,
          quantity: "500g",
          price: 5.00),
      GroceryDomain(
          name: "Lady finger",
          image: Assets.itemsVegLadiesfinger,
          quantity: "500g",
          price: 7.00),
    ]),
    GroceryCategoryDomain(title: "Personal Care", items: [
      GroceryDomain(
          name: "Cleanser",
          image: Assets.itemsPersonalcareBox,
          quantity: "500g",
          price: 5.00),
      GroceryDomain(
          name: "Tooth Brush",
          image: Assets.itemsPersonalcareBrush,
          quantity: "1pcs",
          price: 5.00),
      GroceryDomain(
          name: "Shampoo",
          image: Assets.itemsPersonalcareLiquid,
          quantity: "500g",
          price: 13.00),
      GroceryDomain(
          name: "Night Cream",
          image: Assets.itemsPersonalcareLotiona,
          quantity: "500g",
          price: 10.00),
    ]),
    GroceryCategoryDomain(title: "Dairy", items: []),
    GroceryCategoryDomain(title: "Fruits", items: []),
  ];
}
