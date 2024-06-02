import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/features/common/ui/store_list.dart';
import 'package:deligo/features/food/ui/widgets/custom_filters.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class ServiceProvidersScreen extends StatelessWidget {
  const ServiceProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    (CategoryDomain, String) args =
        ModalRoute.of(context)?.settings.arguments as (CategoryDomain, String);
    final List<Filter> filters = [
      Filter(Icons.star, locale.nearMe),
      Filter(Icons.favorite, locale.favorite),
      Filter(Icons.directions_bike, locale.fastDelivery),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(args.$2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFilters(filters: filters),
            const SizedBox(height: 16),
            Flexible(
              child: StoreList(StoreDomain.serviceList, onTap: (store) {
                Navigator.pushNamed(context, PageRoutes.providerDetailsScreen, arguments: store);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
