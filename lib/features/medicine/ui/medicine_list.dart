import 'package:deligo/features/cart/ui/cart_bottom_bar.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/food/ui/widgets/custom_filters.dart';
import 'package:deligo/features/medicine/ui/medicine_item_card.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final store = StoreDomain.medicineList.first;
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
        title: const Text("Medicines"),
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
          ...List.generate(
            CategoryDomain.medicineList.length,
            (categoryIndex) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: CategoryDomain.medicineList[categoryIndex].items.length,
                itemBuilder: (context, productIndex) {
                  var product = CategoryDomain.medicineList[categoryIndex].items[productIndex];
                  return MedicineItemCard(product);
                },
              );
            },
          )
        ],
      ),
      bottomNavigationBar: CartBottomBar(store),
    );
  }
}
