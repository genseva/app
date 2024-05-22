import 'package:deligo/components/custom_shadow.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/food/ui/widgets/custom_info_widget.dart';
import 'package:deligo/features/grocery/ui/grocery_item_card.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class GroceryStoreScreen extends StatelessWidget {
  const GroceryStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreDomain store = ModalRoute.of(context)?.settings.arguments as StoreDomain;
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      store.name,
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "${store.location} • ",
                          style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey),
                        ),
                        Text(
                          "${store.distance} km",
                          style: theme.textTheme.titleSmall?.copyWith(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 0.4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomInfoWidget(
                      Icons.directions_bike_outlined,
                      "Delivery in",
                      "${store.deliveryTime} min",
                    ),
                    CustomInfoWidget(
                      Icons.watch_later_outlined,
                      "Opening Timing",
                      store.timing,
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 0.4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: CustomTextField(
                        hintText: locale.searchItemOrStore,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, PageRoutes.groceryCategoryScreen),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(Icons.assignment, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const CustomShadow(),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: CategoryDomain.groceryList.length,
                itemBuilder: (context, index) {
                  var category = CategoryDomain.groceryList[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Text(
                              category.title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.chevron_right,
                              color: theme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      if (category.items.isNotEmpty)
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: category.items.length,
                            itemBuilder: (context, index) {
                              return GroceryItemCard(category.items[index]);
                            },
                          ),
                        ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
