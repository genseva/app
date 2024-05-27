import 'package:deligo/components/add_button.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:flutter/material.dart';

class MedicineItemCard extends StatelessWidget {
  const MedicineItemCard(this.item, {super.key});

  final ProductDomain item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset(item.image, height: 90),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "By ${StoreDomain.medicineList.first.name}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black45,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$" + item.price.toStringAsFixed(2),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.cartQuantity.toString() + (item.unit ?? ""),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      AddItemButton(product: item),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const CustomDivider(),
        const SizedBox(height: 10)
      ],
    );
  }
}
