import 'package:deligo/components/category_grid_tile.dart';
import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/cart/model/category_domain.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return CustomScaffold(
      image: Assets.headerHeaderEcommerce,
      title: locale.startShopping,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            CustomTextField(
              bgColor: theme.scaffoldBackgroundColor,
              hintText: locale.searchProducts,
              prefixIcon: Icon(Icons.search, color: theme.primaryColorDark, size: 24),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: CategoryDomain.ecommerceList.length * 2,
                itemBuilder: (context, index) {
                  var category =
                      CategoryDomain.ecommerceList[index % CategoryDomain.ecommerceList.length];
                  return CategoryGridTile(category);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
