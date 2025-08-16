import 'package:genseva/components/custom_scaffold.dart';
import 'package:genseva/features/common/model/category_domain.dart';
import 'package:genseva/features/common/model/store_domain.dart';
import 'package:genseva/features/common/ui/store_heading_tile.dart';
import 'package:genseva/features/common/ui/store_list.dart';
import 'package:genseva/features/common/ui/top_category_list.dart';
import 'package:genseva/features/food/ui/widgets/custom_filters.dart';
import 'package:genseva/generated/assets.dart';
import 'package:genseva/generated/l10n.dart';
import 'package:genseva/routes/page_routes.dart';
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
                  subtitle:
                      '${StoreDomain.groceryList.length} ${locale.StoresFound}',
                ),
                StoreList(
                  StoreDomain.groceryList,
                  onTap: (store) {
                    Navigator.pushNamed(context, PageRoutes.groceryStoreScreen,
                        arguments: store);
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
