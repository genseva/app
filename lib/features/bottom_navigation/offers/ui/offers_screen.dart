import 'package:deligo/Routes/page_routes.dart';
import 'package:deligo/features/bottom_navigation/offers/model/offer_domain.dart';
import 'package:deligo/features/bottom_navigation/widgest/offer_info_popup.dart';
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
    return Scaffold(
      backgroundColor: theme.disabledColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        toolbarHeight: kTextTabBarHeight + 20,
        title: Text(
          "Offers",
          style:
              theme.textTheme.headlineLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
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
            color: theme.indicatorColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          Flexible(
            child: ListView(
              padding: const EdgeInsetsDirectional.only(start: 16, bottom: 20),
              children: [
                const SizedBox(height: 12),
                CustomFilters(filters: filters),
                _buildTitleRow(theme, "Food Offers", locale.seeAll),
                _buildOfferList(theme, OfferDomain.list.sublist(0, 2)),
                _buildTitleRow(theme, "Grocery Offers", locale.seeAll),
                _buildOfferList(theme, OfferDomain.list.sublist(2, OfferDomain.list.length)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleRow(ThemeData theme, String title, String trailing) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 16, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            trailing,
            style: theme.textTheme.headlineSmall!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: theme.primaryColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOfferList(ThemeData theme, List<OfferDomain> offers) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var offer = offers[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  fullscreenDialog: true,
                  opaque: false,
                  barrierColor: theme.scaffoldBackgroundColor.withOpacity(0.5),
                  pageBuilder: (context, _, __) {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      bottomSheet: OfferInfoPopUp(offer: offer),
                    );
                  },
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: theme.scaffoldBackgroundColor,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: offer.offerCode,
                        child: Image.asset(
                          offer.bannerUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            offer.offer,
                            style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            offer.description,
                            maxLines: 2,
                            style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
