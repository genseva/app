import 'package:deligo/components/category_grid_tile.dart';
import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/cart/model/category_domain.dart';
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
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                children: [
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: CategoryDomain.medicineList.length,
                    itemBuilder: (context, index) {
                      var category = CategoryDomain.medicineList[index];
                      return CategoryGridTile(category);
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Pharma Store near me",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    " stores found",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: CategoryDomain.medicineList.length,
                    itemBuilder: (context, index) {
                      var category = CategoryDomain.medicineList[index];
                      return CategoryGridTile(category);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
