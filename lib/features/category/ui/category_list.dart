import 'package:deligo/Routes/page_routes.dart';
import 'package:deligo/features/common/ui/category_grid.dart';
import 'package:deligo/features/common/ui/store_list.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    this.storeListTitle,
    required this.categories,
    required this.stores,
    this.routesName = PageRoutes.accountPage,
  });

  final String? storeListTitle;
  final List<CategoryDomain> categories;
  final List<StoreDomain> stores;
  final String routesName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      children: [
        CategoryGrid(categories),
        const SizedBox(height: 24),
        if (storeListTitle != null) ...[
          Text(
            storeListTitle!,
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "${stores.length} found",
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.hintColor,
            ),
          ),
          const SizedBox(height: 16),
        ],
        StoreList(stores, onTap: (stores){
        Navigator.pushNamed(context, routesName, arguments: stores);
        }),
      ],
    );
  }
}
