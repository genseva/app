import 'package:genseva/features/cart/ui/cart_bottom_bar.dart';
import 'package:genseva/features/common/model/category_domain.dart';
import 'package:genseva/features/common/model/store_domain.dart';
import 'package:genseva/features/food/ui/widgets/custom_filters.dart';
import 'package:genseva/features/medicine/ui/medicine_item_card.dart';
import 'package:genseva/generated/l10n.dart';
import 'package:flutter/material.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final store = StoreDomain.medicineList.first;
    (CategoryDomain, String) args =
        ModalRoute.of(context)?.settings.arguments as (CategoryDomain, String);
    var category = args.$1;
    final List<Filter> filters = [
      Filter(Icons.favorite, locale.favorite),
      Filter(Icons.star, locale.nearMe),
      Filter(Icons.location_on, locale.nearMe),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(args.$2),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomFilters(filters: filters),
          ),
          const Divider(thickness: 0.4),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: category.items.length,
            itemBuilder: (context, productIndex) {
              var product = category.items[productIndex];
              return MedicineItemCard(product);
            },
          ),
        ],
      ),
      bottomNavigationBar: CartBottomBar(store),
    );
  }
}
