import 'package:genseva/components/add_button.dart';
import 'package:genseva/components/custom_divider.dart';
import 'package:genseva/features/common/model/product_domain.dart';
import 'package:genseva/features/common/model/store_domain.dart';
import 'package:flutter/material.dart';

class MedicineItemCard extends StatelessWidget {
  const MedicineItemCard(this.item, {super.key});

  final ProductDomain item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return _buildStoreOption(theme);
          },
        );
      },
      child: Column(
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
                        AddItemButton(
                            store: StoreDomain.medicineList.first,
                            product: item),
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
      ),
    );
  }

  Widget _buildStoreOption(ThemeData theme) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 80,
                    height: 4,
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: theme.hintColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(item.image, height: 90),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        item.name,
                        style: theme.textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "More Seller(s)",
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: Colors.black45),
                ),
                const SizedBox(height: 10),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: StoreDomain.medicineList.length,
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomDivider(),
                    );
                  },
                  itemBuilder: (context, index) {
                    var store = StoreDomain.medicineList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "${store.location}   •   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: theme.hintColor,
                                  ),
                            ),
                            Text(
                              "${store.distance.toStringAsFixed(2)} km",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              r"$" + item.price.toStringAsFixed(2),
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "   •   ${item.cartQuantity} ${item.unit ?? ""}",
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            AddItemButton(store: store, product: item),
                          ],
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
