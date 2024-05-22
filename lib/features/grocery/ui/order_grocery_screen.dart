import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/features/bottom_navigation/home/home_screen.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/common/ui/store_heading_tile.dart';
import 'package:deligo/features/common/ui/store_list.dart';
import 'package:deligo/features/common/ui/top_category_list.dart';
import 'package:deligo/features/food/ui/widgets/custom_filters.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrderGroceryScreen extends StatefulWidget {
  const OrderGroceryScreen({super.key});

  @override
  State<OrderGroceryScreen> createState() => _OrderGroceryScreenState();
}

class _OrderGroceryScreenState extends State<OrderGroceryScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final List<Filter> filters = [
      Filter(Icons.star, locale.nearMe),
      Filter(Icons.favorite, locale.favorite),
      Filter(Icons.directions_bike, locale.fastDelivery),
    ];
    return CustomScaffold(
      image: Assets.headerHeaderGrocery,
      title: locale.orderGrocery,
      child: Column(
        children: [
          TopCategoryList(CategoryDomain.topGroceryList),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CustomFilters(filters: filters),
                StoreHeadingTile(
                  title: locale.groceryNearMe,
                  subtitle: '${StoreDomain.groceryList.length} ${locale.StoresFound}',
                ),
                StoreList(StoreDomain.groceryList)
              ],
            ),
          )
        ],
      ),
    );
  }
}
