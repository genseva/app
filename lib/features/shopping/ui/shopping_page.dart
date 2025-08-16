import '../../../components/custom_scaffold.dart';
import '../../../components/custom_text_field.dart';
import '../../category/ui/category_list.dart';
import '../../common/model/category_domain.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../routes/page_routes.dart';
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
              prefixIcon: Icon(
                Icons.search,
                color: theme.primaryColorDark,
                size: 24,
              ),
            ),
            Flexible(
              child: CategoryList(
                categories:
                    CategoryDomain.ecommerceList + CategoryDomain.ecommerceList,
                categoryRoutes: PageRoutes.shoppingProductScreen,
                stores: const [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
