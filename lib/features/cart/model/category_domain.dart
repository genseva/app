import 'package:deligo/features/cart/model/product_domain.dart';
import 'package:deligo/generated/assets.dart';

class CategoryDomain {
  final String title;
  final String? image;
  final List<ProductDomain> items;

  CategoryDomain(this.title, this.items, {this.image});

  static final List<CategoryDomain> foodList = [
    CategoryDomain(
      "Sandwich",
      [
        ProductDomain(
          "Veg Cheese Sandwich",
          Assets.foodFood1,
          5.00,
          isVeg: true,
          customizable: true,
        ),
        ProductDomain(
          "Grilled Cheese Sandwich",
          Assets.foodFood2,
          8.00,
          isVeg: true,
          customizable: false,
        ),
        ProductDomain(
          "Chicken Sandwich",
          Assets.foodFood3,
          9.00,
          isVeg: false,
          customizable: false,
        ),
        ProductDomain(
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
        ProductDomain(
          "Veg Cheese Pizza",
          Assets.foodFood1,
          5.00,
          isVeg: true,
          customizable: false,
        ),
        ProductDomain(
          "Onion Pizza",
          Assets.foodFood2,
          8.00,
          isVeg: true,
          customizable: false,
        ),
        ProductDomain(
          "Chicken Pizza",
          Assets.foodFood3,
          9.00,
          isVeg: false,
          customizable: true,
        ),
        ProductDomain(
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
        ProductDomain("Fresh Potatoes", Assets.itemsVegPotatoes, 5.00,
            cartQuantity: 500, unit: "g"),
        ProductDomain("Fresh Broccoli", Assets.itemsVegCouli, 5.00, cartQuantity: 500, unit: "g"),
        ProductDomain("Fresh Capsicum", Assets.itemsVegCapsicum, 6.00,
            cartQuantity: 500, unit: "g"),
        ProductDomain("Fresh Eggplant", Assets.itemsVegBringle, 9.00, cartQuantity: 500, unit: "g"),
        ProductDomain("Cauliflower", Assets.itemsVegColiflower, 7.00,
            cartQuantity: 1000, unit: "g"),
        ProductDomain("Onion", Assets.itemsVegOnion, 5.00, cartQuantity: 500, unit: "g"),
        ProductDomain("Lady finger", Assets.itemsVegLadiesfinger, 7.00,
            cartQuantity: 500, unit: "g"),
      ],
    ),
    CategoryDomain(
      "Personal Care",
      [
        ProductDomain("Cleanser", Assets.itemsPersonalcareBox, 5.00, cartQuantity: 250, unit: "ml"),
        ProductDomain("Tooth Brush", Assets.itemsBrush, 5.00, cartQuantity: 1, unit: "pc(s)"),
        ProductDomain("Shampoo", Assets.itemsPersonalcareLiquid, 13.00,
            cartQuantity: 350, unit: "ml"),
        ProductDomain("Night Cream", Assets.itemsLotion, 10.00, cartQuantity: 200, unit: "g"),
      ],
    ),
    CategoryDomain("Dairy", [
      ProductDomain("Milk", Assets.itemsPersonalcareLiquid, 13.00, cartQuantity: 350, unit: "ml"),
    ]),
    CategoryDomain("Fruits", [
      ProductDomain("Fresh Capsicum", Assets.itemsVegCapsicum, 6.00, cartQuantity: 500, unit: "g"),
    ]),
  ];

  static final List<CategoryDomain> ecommerceList = [
    CategoryDomain(
      "His Fashion",
      [],
      image: Assets.categoriesEcomHisfashion,
    ),
    CategoryDomain(
      "Her Fashion",
      [],
      image: Assets.categoriesEcomHerfasion,
    ),
    CategoryDomain(
      "Kid's Fashion",
      [],
      image: Assets.categoriesEcomKidfashion,
    ),
    CategoryDomain(
      "Appliances",
      [],
      image: Assets.categoriesEcomAppliances,
    ),
    CategoryDomain(
      "Phones",
      [],
      image: Assets.categoriesEcomPhone,
    ),
    CategoryDomain(
      "Beauty Care",
      [],
      image: Assets.categoriesEcomBeauty,
    ),
    CategoryDomain(
      "Toys",
      [],
      image: Assets.categoriesEcomToys,
    ),
    CategoryDomain(
      "Health Care",
      [],
      image: Assets.categoriesEcomHealth,
    ),
    CategoryDomain(
      "Pet Supplies",
      [],
      image: Assets.categoriesEcomPet,
    ),
  ];

  static final List<CategoryDomain> medicineList = [
    CategoryDomain(
      "Cough",
      [],
      image: Assets.categoriesCough,
    ),
    CategoryDomain(
      "Pain Relief",
      [],
      image: Assets.categoriesChestPain,
    ),
    CategoryDomain(
      "Skin Care",
      [],
      image: Assets.categoriesSkinRash,
    ),
    CategoryDomain(
      "Headache",
      [],
      image: Assets.categoriesHeadache,
    ),
    CategoryDomain(
      "Fever",
      [],
      image: Assets.categoriesFever,
    ),
    CategoryDomain(
      "Weakness",
      [],
      image: Assets.categoriesWeakness,
    ),
  ];

  static final List<CategoryDomain> serviceList = [
    CategoryDomain(
      "Home Clean",
      [],
      image: Assets.categoriesHandyCleaner,
    ),
    CategoryDomain(
      "Electrician",
      [],
      image: Assets.categoriesHandyElec,
    ),
    CategoryDomain(
      "Plumber",
      [],
      image: Assets.categoriesHandyPlumber,
    ),
    CategoryDomain(
      "Carpainter",
      [],
      image: Assets.categoriesHandyCarpainter,
    ),
    CategoryDomain(
      "Painter",
      [],
      image: Assets.categoriesHandyPainter,
    ),
    CategoryDomain(
      "Gardening",
      [],
      image: Assets.categoriesHandyGardener,
    ),
    CategoryDomain(
      "Mover",
      [],
      image: Assets.categoriesHandyMover,
    ),
    CategoryDomain(
      "Beauty Salon",
      [],
      image: Assets.categoriesHandySalon,
    ),
    CategoryDomain(
      "Sanitize",
      [],
      image: Assets.categoriesHandySanitize,
    ),
  ];
}
