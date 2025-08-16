import '../../../components/custom_scaffold.dart';
import '../../../components/custom_text_field.dart';
import '../../category/ui/category_list.dart';
import '../../common/model/category_domain.dart';
import '../../common/model/store_domain.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../routes/page_routes.dart';
import 'package:flutter/material.dart';

class BookServiceScreen extends StatelessWidget {
  const BookServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return CustomScaffold(
      image: Assets.headerHeaderHandyman,
      title: locale.bookService,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              bgColor: theme.scaffoldBackgroundColor,
              hintText: locale.searchMedicineOrPharmaStore,
              prefixIcon:
                  Icon(Icons.search, color: theme.primaryColorDark, size: 24),
            ),
            Flexible(
              child: CategoryList(
                storeListTitle: AppLocalizations.of(context).providersNearMe,
                stores: StoreDomain.serviceList,
                categories: CategoryDomain.serviceList,
                routesName: PageRoutes.providerDetailsScreen,
                categoryRoutes: PageRoutes.serviceProviderScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
