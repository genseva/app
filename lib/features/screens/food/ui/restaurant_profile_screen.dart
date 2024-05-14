import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/screens/food/model/food_category_domain.dart';
import 'package:deligo/features/screens/food/model/restaurant_domain.dart';
import 'package:deligo/features/screens/food/ui/widgets/custom_info_widget.dart';
import 'package:deligo/features/screens/food/ui/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RestaurantProfilePage extends StatefulWidget {
  const RestaurantProfilePage({super.key});

  @override
  State<RestaurantProfilePage> createState() => _RestaurantProfilePageState();
}

class _RestaurantProfilePageState extends State<RestaurantProfilePage> {
  final GlobalKey _globalKey = GlobalKey();
  final ItemScrollController _itemScrollController = ItemScrollController();
  late var _controller;

  @override
  Widget build(BuildContext context) {
    RestaurantDomain data = ModalRoute.of(context)?.settings.arguments as RestaurantDomain? ??
        RestaurantDomain.restaurantList.first;
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
          Container(
            height: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColorDark.withOpacity(0.1),
                  Theme.of(context).primaryColorDark.withOpacity(0.05),
                  Colors.transparent,
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Expanded(
            child: ScrollablePositionedList.separated(
              itemScrollController: _itemScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: CategoryDomain.list.length,
              itemBuilder: (context, index) {
                var category = CategoryDomain.list[index];
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
                    category.foodList.length,
                    (index) => FoodCard(category.foodList[index]),
                  ),
                );
              },
              separatorBuilder: (context, index) => const CustomDivider(color: Colors.grey),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MenuAnchor(
        alignmentOffset: const Offset(4, 4),
        style: MenuStyle(
          backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColorDark),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
        ),
        builder: (context, menuController, child) {
          _controller = menuController;
          return FloatingActionButton.extended(
            key: _globalKey,
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
          CategoryDomain.list.length,
          (index) {
            var category = CategoryDomain.list[index];
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
    );
  }
}
