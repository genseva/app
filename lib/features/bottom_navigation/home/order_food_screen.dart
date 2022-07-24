import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/rating_card.dart';
import 'package:deligo/features/bottom_navigation/home/home_screen.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class Filter {
  IconData icon;
  String title;
  bool isSelected;
  Function(bool)? onTap;

  Filter(this.icon, this.title, this.isSelected, this.onTap);
}

class Restaurant {
  final String image;
  final String name;
  final String location;
  final String foodType;

  Restaurant(this.image, this.name, this.location, this.foodType);
}

class OrderFoodScreen extends StatelessWidget {
  const OrderFoodScreen({Key? key}) : super(key: key);

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
      Filter(Icons.star, locale.nearMe, true, (p0) => null),
      Filter(Icons.favorite, locale.favorite, false, (p0) => null),
      Filter(Icons.star, locale.bestRated, false, (p0) => null),
      Filter(Icons.directions_bike, locale.fastDelivery, false, (p0) => null),
      Filter(Icons.restaurant_menu, locale.vegOnly, false, (p0) => null),
    ];
    final List<Restaurant> restaurantList = [
      Restaurant('assets/food/restaurant_food1.png', 'Monte Carlo Restaurant',
          'CentralPark', locale.fastFoodBeverages),
      Restaurant('assets/food/restaurant_food2.png', 'Hotel China Town',
          'Food Park', locale.chineseFoodsItalianFoods),
      Restaurant('assets/food/restaurant_food3.png', 'Auli Restaurant',
          'CentralPark', locale.fastFoodBeverages),
      Restaurant('assets/food/restaurant_food1.png', 'Monte Carlo Restaurant',
          'CentralPark', locale.fastFoodBeverages),
      Restaurant('assets/food/restaurant_food2.png', 'Hotel China Town',
          'Food Park', locale.chineseFoodsItalianFoods),
      Restaurant('assets/food/restaurant_food3.png', 'Auli Restaurant',
          'CentralPark', locale.fastFoodBeverages),
    ];
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
                    onPressed: () {},
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
                          .headline6!
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
                                  .bodyText1!
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8,
              runSpacing: -4,
              children: List.generate(
                filters.length,
                (index) => FilterChip(
                  selected: filters[index].isSelected,
                  backgroundColor: Colors.white,
                  selectedColor: blackColor,
                  disabledColor: Colors.white,
                  avatar: Icon(
                    filters[index].icon,
                    color: blackColor,
                    size: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(color: greyTextColor.withOpacity(0.1)),
                  label: Text(
                    filters[index].title,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: filters[index].isSelected
                              ? Theme.of(context).scaffoldBackgroundColor
                              : null,
                          fontSize: 12,
                        ),
                  ),
                  onSelected: filters[index].onTap,
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              locale.foodNearMe,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            subtitle: Text(
              '24 ${locale.restaurantsFound}',
              style: Theme.of(context).textTheme.caption!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          restaurantList[index].location,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
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
                                  .bodyText1!
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
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 12, color: greyTextColor2),
                            )
                          ],
                        ),
                        const Divider(
                          endIndent: 16,
                        ),
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
                                  .bodyText1!
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
          )
        ],
      ),
    );
  }
}
