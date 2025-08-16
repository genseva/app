import 'package:genseva/components/custom_scaffold.dart';
import 'package:genseva/components/custom_text_field.dart';
import 'package:genseva/features/category/ui/category_list.dart';
import 'package:genseva/features/common/model/category_domain.dart';
import 'package:genseva/features/common/model/store_domain.dart';
import 'package:genseva/generated/assets.dart';
import 'package:genseva/generated/l10n.dart';
import 'package:genseva/routes/page_routes.dart';
import 'package:flutter/material.dart';

class OrderMedicinePage extends StatelessWidget {
  const OrderMedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return CustomScaffold(
      image: Assets.headerHeaderMedicine,
      title: locale.orderMedicine,
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
                storeListTitle: locale.pharmaStoreNearMe,
                stores: StoreDomain.medicineList,
                categories: CategoryDomain.medicineList,
                routesName: PageRoutes.medicineStorePage,
                categoryRoutes: PageRoutes.medicineList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
