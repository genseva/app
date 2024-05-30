import 'package:deligo/Routes/page_routes.dart';
import 'package:deligo/features/food/ui/widgets/custom_filters.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    final List<Filter> filters = [
      Filter(Icons.restaurant_menu, locale.food),
      Filter(Icons.shopping_basket, locale.grocery),
      Filter(Icons.directions_bike, locale.ride),
      Filter(Icons.restaurant_menu, locale.vegOnly),
      Filter(Icons.car_crash_sharp, locale.cabs),
      Filter(Icons.medical_services_outlined, locale.medicine),
      Filter(Icons.markunread_mailbox, locale.parcel),
      Filter(Icons.shopping_bag_outlined, locale.shop),
      Filter(Icons.home_repair_service_outlined, locale.service),
    ];

    final List<String> banners = [
      Assets.bannerFood1,
      Assets.bannerFood2,
      Assets.bannerFood2,
      Assets.bannerGrocery1,
      Assets.bannerGrocery1,
      Assets.bannerGrocery2,
    ];
    var theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.disabledColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: null,
        title: Text(
          "Offers",
          style: theme.textTheme.headlineLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
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
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xffDFF6E0),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Icon(
                  Icons.local_offer,
                  color: theme.primaryColor,
                  size: 15,
                ),
                const SizedBox(width: 10),
                Text(
                  "You've saved ",
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
                ),
                Text(
                  r"$48.50 ",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.w600),
                ),
                Text(
                  "from offers ",
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
                ),
              ],
            ),
          ),
          CustomFilters(filters: filters),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      banners[index],
                      fit: BoxFit.cover,
                      scale: 4,
                    )),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
