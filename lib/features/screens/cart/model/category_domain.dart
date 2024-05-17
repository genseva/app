import 'package:deligo/features/screens/cart/model/food_domain.dart';
import 'package:deligo/generated/assets.dart';

class CategoryDomain {
  final String title;
  final List<FoodDomain> items;

  CategoryDomain(this.title, this.items);

  static final List<CategoryDomain> foodList = [
    CategoryDomain(
      "Sandwich",
      [
        FoodDomain(
          "Veg Cheese Sandwich",
          Assets.foodFood1,
          5.00,
          isVeg: true,
          customizable: true,
        ),
        FoodDomain(
          "Grilled Cheese Sandwich",
          Assets.foodFood2,
          8.00,
          isVeg: true,
          customizable: false,
        ),
        FoodDomain(
          "Chicken Sandwich",
          Assets.foodFood3,
          9.00,
          isVeg: false,
          customizable: false,
        ),
        FoodDomain(
          "Roast Beef Sandwich",
          Assets.foodFood1,
          10.00,
          isVeg: false,
          customizable: false,
        ),
      ],
    ),
    CategoryDomain(
      "Pizza",
      [
        FoodDomain(
          "Veg Cheese Pizza",
          Assets.foodFood1,
          5.00,
          isVeg: true,
          customizable: false,
        ),
        FoodDomain(
          "Onion Pizza",
          Assets.foodFood2,
          8.00,
          isVeg: true,
          customizable: false,
        ),
        FoodDomain(
          "Chicken Pizza",
          Assets.foodFood3,
          9.00,
          isVeg: false,
          customizable: true,
        ),
        FoodDomain(
          "Roast Beef Pizza",
          Assets.foodFood1,
          10.00,
          isVeg: false,
          customizable: false,
        ),
      ],
    ),
  ];

  static final List<CategoryDomain> groceryList = [
    CategoryDomain(
      "Vegetable",
      [
        FoodDomain("Fresh Potatoes", Assets.itemsVegPotatoes, 5.00, cartQuantity: 500, unit: "g"),
        FoodDomain("Fresh Broccoli", Assets.itemsVegCouli, 5.00, cartQuantity: 500, unit: "g"),
        FoodDomain("Fresh Capsicum", Assets.itemsVegCapsicum, 6.00, cartQuantity: 500, unit: "g"),
        FoodDomain("Fresh Eggplant", Assets.itemsVegBringle, 9.00, cartQuantity: 500, unit: "g"),
        FoodDomain("Cauliflower", Assets.itemsVegColiflower, 7.00, cartQuantity: 1000, unit: "g"),
        FoodDomain("Onion", Assets.itemsVegOnion, 5.00, cartQuantity: 500, unit: "g"),
        FoodDomain("Lady finger", Assets.itemsVegLadiesfinger, 7.00, cartQuantity: 500, unit: "g"),
      ],
    ),
    CategoryDomain(
      "Personal Care",
      [
        FoodDomain("Cleanser", Assets.itemsPersonalcareBox, 5.00, cartQuantity: 250, unit: "ml"),
        FoodDomain("Tooth Brush", Assets.itemsBrush, 5.00, cartQuantity: 1, unit: "pc(s)"),
        FoodDomain("Shampoo", Assets.itemsPersonalcareLiquid, 13.00, cartQuantity: 350, unit: "ml"),
        FoodDomain("Night Cream", Assets.itemsLotion, 10.00, cartQuantity: 200, unit: "g"),
      ],
    ),
    CategoryDomain("Dairy", []),
    CategoryDomain("Fruits", []),
  ];
}
