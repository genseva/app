import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_field.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class Category {
  String image;
  String title;
  Function()? onTap;

  Category(this.image, this.title, this.onTap);
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> banners = [
    "assets/banner/food1.png",
    "assets/banner/food2.png",
    "assets/banner/grocery1.png",
    "assets/banner/grocery2.png",
  ];

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final List<Category> categories = [
      Category('assets/category/catg_ride.png', locale.ride,
          () => Navigator.pushNamed(context, PageRoutes.bookRideScreen)),
      Category('assets/category/catg_cab.png', locale.cabs,
          () => Navigator.pushNamed(context, PageRoutes.bookCabScreen)),
      Category(
        'assets/category/catg_food.png',
        locale.food,
        () => Navigator.pushNamed(context, PageRoutes.orderFoodScreen),
      ),
      Category(
        'assets/category/catg_grocery.png',
        locale.grocery,
        () => Navigator.pushNamed(context, PageRoutes.orderGroceryScreen),
      ),
      Category('assets/category/catg_medicine.png', locale.medicine,
          () => Navigator.pushNamed(context, PageRoutes.orderMedicineScreen)),
      Category('assets/category/catg_parcel.png', locale.parcel,
          () => Navigator.pushNamed(context, PageRoutes.bookParcelScreen)),
      Category('assets/category/catg_hanydman.png', locale.service,
          () => Navigator.pushNamed(context, PageRoutes.bookServiceScreen)),
      Category('assets/category/catg_ecommerce.png', locale.shop,
          () => Navigator.pushNamed(context, PageRoutes.shoppingScreen)),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),
          child: ListTile(
            // contentPadding: const EdgeInsetsDirectional.only(start: 6),
            title: Row(
              children: [
                Icon(
                  Icons.home,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  locale.home,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: blackColor,
                ),
              ],
            ),
            subtitle: const Text(
              ' B 101, Nirvana Point, Hemilton',
              // style: Theme.of(context).textTheme.caption,
            ),
            trailing: GestureDetector(
              onTap: () => Navigator.pushNamed(context, PageRoutes.accountPage),
              child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  )),
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            Image.asset('assets/banner_home.png'),
            const SizedBox(
              height: 22,
            ),
            Text(
              locale.whatAreYouLookingFor,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              hintText: locale.searchItemOrStore,
              prefixIcon: const Icon(Icons.search),
            ),
            const SizedBox(
              height: 12,
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: categories.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => GestureDetector(
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
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  locale.saveExtraWhileOrdering,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  locale.seeAll,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        banners[index],
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
