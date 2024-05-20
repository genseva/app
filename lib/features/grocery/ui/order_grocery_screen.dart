import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_app_bar.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/components/store_list.dart';
import 'package:deligo/features/bottom_navigation/home/home_screen.dart';
import 'package:deligo/features/cart/model/store_domain.dart';
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
    final List<Category> categories = [
      Category('assets/grocery/grocery_dairy.png', locale.dairy, null),
      Category('assets/grocery/grocery_fruits.png', locale.fruits, null),
      Category('assets/grocery/grocery_personalcare.png', locale.personalCare, null),
      Category('assets/grocery/grocery_vegetable.png', locale.vegetable, null),
    ];
    final List<Filter> filters = [
      Filter(Icons.star, locale.nearMe),
      Filter(Icons.favorite, locale.favorite),
      Filter(Icons.directions_bike, locale.fastDelivery),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: CustomAppBar(
          title: locale.orderGrocery,
          image: Assets.headerHeaderGrocery,
          appbarBottom: Positioned(
            bottom: 0,
            left: 8,
            right: 0,
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10.0),
                  child: GestureDetector(
                    onTap: categories[index].onTap,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              categories[index].image,
                              fit: BoxFit.cover,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            categories[index].title,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 8,
          ),
          CustomFilters(filters: filters),
          const CustomDivider(),
          ListTile(
            title: Text(
              locale.groceryNearMe,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            subtitle: Text(
              "24 ${locale.StoresFound}",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 13,
                    color: greyTextColor,
                  ),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: greyTextColor.withOpacity(0.2),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.search,
                  color: blackColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: StoreList(
              StoreDomain.groceryList,
              onTap: (store) {},
            ),
          ),
        ],
      ),
    );
  }
}
