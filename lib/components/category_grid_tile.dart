
import 'package:deligo/features/cart/model/category_domain.dart';
import 'package:flutter/material.dart';

class CategoryGridTile extends StatelessWidget {
  const CategoryGridTile(this.category, {super.key});

  final CategoryDomain category;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(category.title),
      ),
      child: Image.asset(category.image!),
    );
  }
}
