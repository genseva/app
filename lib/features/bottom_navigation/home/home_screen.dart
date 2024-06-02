import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/bottom_navigation/offers/model/offer_domain.dart';
import 'package:deligo/features/bottom_navigation/widgest/offer_info_popup.dart';
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
  const HomeScreen({super.key});

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
    var theme = Theme.of(context);
    const horizontalPadding = EdgeInsets.symmetric(horizontal: 16.0);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kTextTabBarHeight + 20),
        child: SafeArea(
          child: ListTile(
            title: Row(
              children: [
                Icon(Icons.home, color: theme.primaryColor),
                const SizedBox(width: 10),
                Text(
                  locale.home,
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 12,
                ),
                Icon(Icons.keyboard_arrow_down, color: blackColor),
              ],
            ),
            subtitle: const Text(' B 101, Nirvana Point, Hemilton'),
            trailing: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.accountPage);
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: theme.primaryColor,
                child: Icon(
                  Icons.person,
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: horizontalPadding,
            child: Image.asset('assets/banner_home.png'),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: horizontalPadding,
            child: Text(
              locale.whatAreYouLookingFor,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: locale.searchItemOrStore,
            prefixIcon: const Icon(Icons.search),
            margin: horizontalPadding,
          ),
          const SizedBox(height: 12),
          GridView.builder(
            padding: horizontalPadding,
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
                      style: theme.textTheme.bodyLarge!.copyWith(fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: horizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  locale.saveExtraWhileOrdering,
                  style: theme.textTheme.headlineSmall!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  locale.seeAll,
                  style: theme.textTheme.headlineSmall!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 130,
            child: ListView.separated(
              padding: horizontalPadding,
              scrollDirection: Axis.horizontal,
              itemCount: OfferDomain.list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: theme.scaffoldBackgroundColor,
                    builder: (context) {
                      return OfferInfoPopUp(offer: OfferDomain.list[index]);
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    OfferDomain.list[index].bannerUrl,
                    height: 130,
                    width: MediaQuery.of(context).size.width * 0.64,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
