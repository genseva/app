import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/components/custom_shadow.dart';
import 'package:deligo/features/cart/ui/cart_bottom_bar.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/food/ui/widgets/custom_info_widget.dart';
import 'package:deligo/features/medicine/ui/medicine_item_card.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MedicineStorePage extends StatefulWidget {
  const MedicineStorePage({super.key});

  @override
  State<MedicineStorePage> createState() => _MedicineStorePageState();
}

class _MedicineStorePageState extends State<MedicineStorePage> {
  @override
  Widget build(BuildContext context) {
    StoreDomain store =
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
          const SizedBox(width: 16)
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
                  store.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${store.location} • ",
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInfoWidget(Icons.star, "60+ ratings", "4.2"),
                CustomInfoWidget(Icons.access_time, AppLocalizations.of(context).openingTiming, store.timing),
              ],
            ),
          ),
          const CustomShadow(),
          Expanded(
            child: ScrollablePositionedList.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: CategoryDomain.medicineList.length,
              itemBuilder: (context, index) {
                var category = CategoryDomain.medicineList[index];
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
                    (index) => MedicineItemCard(category.items[index]),
                  ),
                );
              },
              separatorBuilder: (context, index) => const CustomDivider(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CartBottomBar(store),
    );
  }
}
