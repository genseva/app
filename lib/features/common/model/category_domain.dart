import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/generated/assets.dart';

class CategoryDomain {
  final String title;
  final String? image;
  final List<ProductDomain> items;
  final List<String>? subCategories;

  CategoryDomain(this.title, this.items, {this.image, this.subCategories});

  static final List<CategoryDomain> topFoodList = [
    CategoryDomain(
      "Fast Foods",
      [],
      image: Assets.foodFoodcategoryFastfood,
    ),
    CategoryDomain(
      "Chinese",
      [],
      image: Assets.foodFoodcategoryChinese,
    ),
    CategoryDomain(
      "Sea Food",
      [],
      image: Assets.foodFoodcategorySeafood,
    ),
    CategoryDomain(
      "Dessert",
      [],
      image: Assets.foodFoodcategoryDessert,
    ),
  ];

  static final List<CategoryDomain> topGroceryList = [
    CategoryDomain(
      "Diary",
      [],
      image: Assets.groceryGroceryDairy,
    ),
    CategoryDomain(
      "Fruits",
      [],
      image: Assets.groceryGroceryFruits,
    ),
    CategoryDomain(
      "Personal Care",
      [],
      image: Assets.groceryGroceryPersonalcare,
    ),
    CategoryDomain(
      "Vegetable",
      [],
      image: Assets.groceryGroceryVegetable,
    ),
  ];

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
      subCategories: [
        "Clothing",
        "Shoes",
        "Jewellery",
        "Watches",
        "Handbags",
        "Accessories",
        "Googles",
        "Earings"
      ],
      image: Assets.categoriesEcomHerfasion,
    ),
    CategoryDomain(
      "Kid's Fashion",
      [],
      subCategories: ["Clothing", "Shoes", "Watches", "Handbags", "Accessories"],
      image: Assets.categoriesEcomKidfashion,
    ),
    CategoryDomain(
      "Appliances",
      [],
      subCategories: ["Washing Machine", "Television", "Refrigerator"],
      image: Assets.categoriesEcomAppliances,
    ),
    CategoryDomain(
      "Phones",
      [],
      subCategories: ["Mobile", "Tablet", "Laptop", "Smart Watch"],
      image: Assets.categoriesEcomPhone,
    ),
    CategoryDomain(
      "Beauty Care",
      [],
      subCategories: ["Hair Care", "Skin Care", "Body Care", "Make Up"],
      image: Assets.categoriesEcomBeauty,
    ),
    CategoryDomain(
      "Toys",
      [],
      subCategories: ["Board Games", "Games", "Dolls", "Puzzles"],
      image: Assets.categoriesEcomToys,
    ),
    CategoryDomain(
      "Health Care",
      [],
      subCategories: ["Health Care", "Health Care", "Health Care", "Health Care"],
      image: Assets.categoriesEcomHealth,
    ),
    CategoryDomain(
      "Pet Supplies",
      [],
      subCategories: ["Pet Supplies", "Pet Supplies", "Pet Supplies", "Pet Supplies"],
      image: Assets.categoriesEcomPet,
    ),
  ];

  static final List<CategoryDomain> medicineList = [
    CategoryDomain(
      "Cough",
      [],
      subCategories: ["Chest Pain", "Cold"],
      image: Assets.categoriesCough,
    ),
    CategoryDomain(
      "Pain Relief",
      [],
      subCategories: [
        "Body Pain with Fever",
        "Headache",
        "Back Pain",
        "Chest Pain",
        "Leg & Thigh Pain",
        "Stomach Pain"
      ],
      image: Assets.categoriesChestPain,
    ),
    CategoryDomain(
      "Skin Care",
      [],
      subCategories: [
        "Body Pain with Fever",
      ],
      image: Assets.categoriesSkinRash,
    ),
    CategoryDomain(
      "Headache",
      [],
      subCategories: [
        "Body Pain with Fever",
        "Headache",
        "Back Pain",
      ],
      image: Assets.categoriesHeadache,
    ),
    CategoryDomain(
      "Fever",
      [],
      subCategories: [
        "Body Pain with Fever",
        "Headache",
        "Back Pain",
        "Chest Pain",
        "Leg & Thigh Pain",
        "Stomach Pain"
      ],
      image: Assets.categoriesFever,
    ),
    CategoryDomain(
      "Weakness",
      [],
      subCategories: [
        "Body Pain with Fever",
        "Headache",
        "Back Pain",
        "Chest Pain",
        "Leg & Thigh Pain",
        "Stomach Pain"
      ],
      image: Assets.categoriesWeakness,
    ),
  ];

  static final List<CategoryDomain> serviceList = [
    CategoryDomain(
      "Home Clean",
      [],
      subCategories: ["Floor Clean, Carpet Clean", "Carpet Clean", "Garden Clean"],
      image: Assets.categoriesHandyCleaner,
    ),
    CategoryDomain(
      "Electrician",
      [],
      subCategories: ["Fan Fitting", "TV Installation", "AC Installation", "CCTV Installation"],
      image: Assets.categoriesHandyElec,
    ),
    CategoryDomain(
      "Plumber",
      [],
      subCategories: [
        "Tap, Basin & Sink Problem",
        "Bathroom Water Filter",
        "Bathroom Fittings",
        "Blocks & Leakages",
        "Water Tank Problem",
        "Pipeline & pumps",
        "Water Tap Change & Installation",
        "Pipeline Installation"
      ],
      image: Assets.categoriesHandyPlumber,
    ),
    CategoryDomain(
      "Carpainter",
      [],
      subCategories: ["Painting", "Wall Painting", "Floor Painting", "Curtain Painting"],
      image: Assets.categoriesHandyCarpainter,
    ),
    CategoryDomain(
      "Painter",
      [],
      subCategories: ["Painting", "Wall Painting", "Floor Painting", "Curtain Painting"],
      image: Assets.categoriesHandyPainter,
    ),
    CategoryDomain(
      "Gardening",
      [],
      subCategories: ["Gardening", "Gardening", "Gardening", "Gardening"],
      image: Assets.categoriesHandyGardener,
    ),
    CategoryDomain(
      "Mover",
      [],
      subCategories: ["Mover", "Mover", "Mover", "Mover"],
      image: Assets.categoriesHandyMover,
    ),
    CategoryDomain(
      "Beauty Salon",
      [],
      subCategories: ["Haircut", "Makeup", "Manicure", "Haircut"],
      image: Assets.categoriesHandySalon,
    ),
    CategoryDomain(
      "Sanitize",
      [],
      subCategories: ["Sanitize", "Sanitize", "Sanitize", "Sanitize"],
      image: Assets.categoriesHandySanitize,
    ),
  ];
}
