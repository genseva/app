import 'package:deligo/Routes/page_routes.dart';
import 'package:deligo/features/food/ui/widgets/custom_filters.dart';
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
    var theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
        ],
      ),
    ));
  }
}
