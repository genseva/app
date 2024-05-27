import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/common/model/category_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:flutter/material.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab(this.provider, {super.key});

  final StoreDomain provider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          var services = CategoryDomain.serviceList[2].subCategories![index];
          return Row(
            children: [
              Expanded(
                  child: Text(
                services,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
              )),
              Text(
                r"$" "${provider.serviceCharge}",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.hintColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Text(
                " /hr",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.hintColor,
                  fontSize: 11,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomDivider(),
          );
        },
        itemCount: CategoryDomain.serviceList[2].subCategories!.length);
  }
}
