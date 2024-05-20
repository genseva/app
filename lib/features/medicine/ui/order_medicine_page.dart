import 'package:deligo/features/common/category_grid.dart';
import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/common/store_list.dart';
import 'package:deligo/features/cart/model/category_domain.dart';
import 'package:deligo/features/cart/model/store_domain.dart';
import 'package:deligo/features/category/ui/category_list.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
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
              prefixIcon: Icon(Icons.search, color: theme.primaryColorDark, size: 24),
            ),
            Flexible(
              child: CategoryList(
                storeListTitle: "Pharma Store near me",
                stores: StoreDomain.medicineList,
                categories: CategoryDomain.medicineList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
