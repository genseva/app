import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class SubCategoryList extends StatelessWidget {
  const SubCategoryList({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    CategoryDomain category = ModalRoute.of(context)?.settings.arguments as CategoryDomain? ??
        CategoryDomain.medicineList.first;
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return CustomScaffold(
        image: category.image ?? Assets.headerHeaderPackage,
        title: category.title,
        bgColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                bgColor: theme.scaffoldBackgroundColor,
                hintText: locale.searchProducts,
                prefixIcon: Icon(Icons.search, color: theme.primaryColorDark, size: 24),
              ),
              const SizedBox(height: 20),
              Text(
              "Select Category",
                style: theme.textTheme.labelLarge?.copyWith(color: theme.hintColor),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    var item = category.subCategories?[index];
                    return Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: theme.hintColor.withOpacity(0.3), width: 0.5),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text("$item")),
                           Icon(Icons.chevron_right_outlined, color: theme.hintColor,size: 28,),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: category.subCategories?.length ?? 0,
                ),
              ),
            ],
          ),
        ));
  }
}
