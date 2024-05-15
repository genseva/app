import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/components/rating_card.dart';
import 'package:deligo/features/bottom_navigation/home/home_screen.dart';
import 'package:deligo/features/screens/food/model/restaurant_domain.dart';
import 'package:deligo/features/screens/food/ui/widgets/custom_filters.dart';
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
    final List<Category> categories = [
      Category('assets/food/foodcategory_fastfood.png', locale.fastFoods, null),
      Category('assets/food/foodcategory_chinese.png', locale.chinese, null),
      Category('assets/food/foodcategory_seafood.png', locale.seaFood, null),
      Category('assets/food/foodcategory_dessert.png', locale.dessert, null),
    ];
    final List<Filter> filters = [
      Filter(Icons.star, locale.nearMe),
      Filter(Icons.favorite, locale.favorite),
      Filter(Icons.star, locale.bestRated),
      Filter(Icons.directions_bike, locale.fastDelivery),
      Filter(Icons.restaurant_menu, locale.vegOnly),
    ];
    final List<RestaurantDomain> restaurantList =
        RestaurantDomain.restaurantList;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Stack(
          children: [
            Image.asset(
              'assets/header/header_food.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 12,
                    ),
                    child: Text(
                      locale.orderFoods,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
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
          ],
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
              locale.foodNearMe,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            subtitle: Text(
              '24 ${locale.restaurantsFound}',
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
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, PageRoutes.restaurantPage,
                    arguments: restaurantList[index]),
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
                        children: <Widget>[
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
                                locale.deliveryInMins,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 12, color: greyTextColor2),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '1.5 ${locale.km}',
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
                              const RatingCard(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                restaurantList[index].foodType,
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
