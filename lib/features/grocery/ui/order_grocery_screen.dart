import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_app_bar.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/bottom_navigation/home/home_screen.dart';
import 'package:deligo/features/food/ui/widgets/custom_filters.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../routes/page_routes.dart';

class Store {
  final String image;
  final String name;
  final String location;
  final String deliveryTime;
  final String distance;
  final String timing;

  Store(this.image, this.name, this.location, this.deliveryTime, this.distance,
      this.timing);
}

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
      Category(
          'assets/grocery/grocery_personalcare.png', locale.personalCare, null),
      Category('assets/grocery/grocery_vegetable.png', locale.vegetable, null),
    ];
    final List<Filter> filters = [
      Filter(Icons.star, locale.nearMe),
      Filter(Icons.favorite, locale.favorite),
      Filter(Icons.directions_bike, locale.fastDelivery),
    ];
    final List<Store> restaurantList = [
      Store('assets/grocery/store_1.png', 'Megamart 24x7', 'CentralPark', '20',
          '1.5 km', '24x7 Open'),
      Store('assets/grocery/store_2.png', 'Citylime Store', 'Food Park', '30',
          '4.5 km', '08:00 am to 10:00 pm'),
      Store('assets/grocery/store_3.png', 'Delight Grocery Store',
          'CentralPark', '25', '2.5 km', '09:00 am to 09:00 pm'),
      Store('assets/grocery/store_1.png', 'Monte Carlo Store', 'CentralPark',
          '10', '0.5 km', '24x7 Open'),
      Store('assets/grocery/store_2.png', 'Hotel China Town', 'Food Park', '20',
          '1.5 km', '08:30 am to 11:00 pm'),
      Store('assets/grocery/store_3.png', 'Auli Store', 'CentralPark', '23',
          '4.5 km', '08:00 am to 10:00 pm'),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 10),
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
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: restaurantList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.groceryStoreScreen),
                child: Row(
                  children: [
                    Image.asset(
                      restaurantList[index].image,
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurantList[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            restaurantList[index].location,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 12, color: greyTextColor),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "Delivery in ${restaurantList[index].deliveryTime} mins",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 12, color: greyTextColor2),
                              ),
                              Text(
                                "  •  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 12, color: greyTextColor2),
                              ),
                              Text(
                                '${restaurantList[index].distance} ${locale.km}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 12, color: greyTextColor2),
                              )
                            ],
                          ),
                          const CustomDivider(),
                          Row(
                            children: [
                              Text(
                                restaurantList[index].timing,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: greyTextColor3,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
