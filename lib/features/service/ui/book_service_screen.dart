import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/category/ui/category_list.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
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
              prefixIcon: Icon(Icons.search, color: theme.primaryColorDark, size: 24),
            ),
            Flexible(
              child: CategoryList(
                storeListTitle: "Providers near me",
                stores: StoreDomain.serviceList,
                categories: CategoryDomain.serviceList,
                routesName: PageRoutes.providerDetailsScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
