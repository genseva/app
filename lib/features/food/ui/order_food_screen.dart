import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/common/ui/store_heading_tile.dart';
import 'package:deligo/features/common/ui/store_list.dart';
import 'package:deligo/features/common/ui/top_category_list.dart';
import 'package:deligo/features/food/ui/widgets/custom_filters.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class OrderFoodScreen extends StatefulWidget {
  const OrderFoodScreen({super.key});

  @override
  State<OrderFoodScreen> createState() => _OrderFoodScreenState();
}

class _OrderFoodScreenState extends State<OrderFoodScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final List<Filter> filters = [
      Filter(Icons.star, locale.nearMe),
      Filter(Icons.favorite, locale.favorite),
      Filter(Icons.star, locale.bestRated),
      Filter(Icons.directions_bike, locale.fastDelivery),
      Filter(Icons.restaurant_menu, locale.vegOnly),
    ];
    return CustomScaffold(
      image: Assets.headerHeaderFood,
      title: locale.orderFoods,
      child: Column(
        children: [
          TopCategoryList(CategoryDomain.topFoodList),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CustomFilters(filters: filters),
                StoreHeadingTile(
                  title: locale.foodNearMe,
                  subtitle: '${StoreDomain.foodList.length} ${locale.restaurantsFound}',
                ),
                StoreList(
                  StoreDomain.foodList,
                  onTap: (store) {
                    Navigator.pushNamed(context, PageRoutes.restaurantPage, arguments: store);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
