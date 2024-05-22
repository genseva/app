import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid(this.list, {super.key});

  final List<CategoryDomain> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        var category = list[index];
        return GestureDetector(
          onTap: () {
            if (category.subCategories?.isNotEmpty == true) {
              Navigator.pushNamed(context, PageRoutes.subCategoryPage, arguments: category);
            }
          },
          child: GridTile(
            header: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(category.title),
            ),
            child: Image.asset(category.image!),
          ),
        );
      },
    );
  }
}
