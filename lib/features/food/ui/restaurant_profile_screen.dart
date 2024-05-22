import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/components/custom_shadow.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/food/ui/widgets/custom_info_widget.dart';
import 'package:deligo/features/food/ui/widgets/food_card.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RestaurantProfilePage extends StatefulWidget {
  const RestaurantProfilePage({super.key});

  @override
  State<RestaurantProfilePage> createState() => _RestaurantProfilePageState();
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  late MenuController _controller;

  @override
  Widget build(BuildContext context) {
    StoreDomain data =
        ModalRoute.of(context)?.settings.arguments as StoreDomain? ?? StoreDomain.foodList.first;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  data.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${data.location} • ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "1.5 km",
                      style:
                          Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInfoWidget(Icons.star, "60+ ratings", "4.2"),
                CustomInfoWidget(Icons.directions_bike_outlined, "Delivery in", "20 min"),
                CustomInfoWidget(Icons.restaurant_menu, "Price Range", r"$$$$"),
              ],
            ),
          ),
          const CustomShadow(),
          Expanded(
            child: ScrollablePositionedList.separated(
              itemScrollController: _itemScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: CategoryDomain.foodList.length,
              itemBuilder: (context, index) {
                var category = CategoryDomain.foodList[index];
                return ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: index == 0,
                  childrenPadding: const EdgeInsets.only(top: 16),
                  dense: true,
                  shape: InputBorder.none,
                  title: Text(
                    category.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  children: List.generate(
                    category.items.length,
                    (index) => FoodCard(category.items[index]),
                  ),
                );
              },
              separatorBuilder: (context, index) => const CustomDivider(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MenuAnchor(
        alignmentOffset: const Offset(4, 4),
        style: MenuStyle(
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColorDark),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
        ),
        builder: (context, menuController, child) {
          _controller = menuController;
          return FloatingActionButton.extended(
            icon: const Icon(Icons.restaurant_menu, size: 20),
            label: const Text("Menu"),
            shape: const StadiumBorder(),
            backgroundColor: Theme.of(context).primaryColorDark,
            foregroundColor: Theme.of(context).scaffoldBackgroundColor,
            extendedIconLabelSpacing: 16,
            onPressed: () {
              menuController.isOpen ? menuController.close() : menuController.open();
            },
          );
        },
        menuChildren: List.generate(
          CategoryDomain.foodList.length,
          (index) {
            var category = CategoryDomain.foodList[index];
            return GestureDetector(
              onTap: () {
                _itemScrollController.scrollTo(
                  index: index,
                  duration: const Duration(milliseconds: 500),
                );
                _controller.close();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).scaffoldBackgroundColor),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.checkoutPage);
          },
          child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Theme.of(context).primaryColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r"1 Item • $ 5.00",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "Extra Charges may apply",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: Colors.grey.shade300),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.shopping_basket_outlined, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      "View Cart",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
