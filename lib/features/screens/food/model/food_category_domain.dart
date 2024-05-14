import 'package:deligo/features/screens/food/model/food_domain.dart';
import 'package:deligo/generated/assets.dart';

class CategoryDomain {
  final String title;
  final List<FoodDomain> foodList;

  CategoryDomain(this.title, this.foodList);

  static final List<CategoryDomain> list = [
    CategoryDomain(
      "Sandwich",
      [
        FoodDomain("Veg Cheese Sandwich", Assets.foodFood1, 5.00, true, true),
        FoodDomain("Grilled Cheese Sandwich", Assets.foodFood2, 8.00, true, false),
        FoodDomain("Chicken Sandwich", Assets.foodFood3, 9.00, false, false),
        FoodDomain("Roast Beef Sandwich", Assets.foodFood1, 10.00, false, false),
      ],
    ),
    CategoryDomain(
      "Pizza",
      [
        FoodDomain("Veg Cheese Pizza", Assets.foodFood1, 5.00, true, false),
        FoodDomain("Onion Pizza", Assets.foodFood2, 8.00, true, false),
        FoodDomain("Chicken Pizza", Assets.foodFood3, 9.00, false, true),
        FoodDomain("Roast Beef Pizza", Assets.foodFood1, 10.00, false, false),
      ],
    ),
  ];
}
