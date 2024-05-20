import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/cart/model/store_domain.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class StoreList extends StatelessWidget {
  const StoreList(this.list, {super.key, this.onTap});

  final List<StoreDomain> list;
  final Function(StoreDomain)? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context);
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: list.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var store = list[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () => onTap?.call(store),
            child: Row(
              children: [
                Image.asset(
                  store.image,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.name,
                        style: theme.textTheme.headlineSmall!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        store.location,
                        style: theme
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 12, color: theme.hintColor),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Delivery in ${store.deliveryTime} mins",
                            style: theme
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12, color: theme.unselectedWidgetColor),
                          ),
                          Text(
                            "  •  ",
                            style: theme
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12, color: theme.unselectedWidgetColor),
                          ),
                          Text(
                            '${store.distance} ${locale.km}',
                            style: theme
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12, color: theme.unselectedWidgetColor),
                          )
                        ],
                      ),
                      const CustomDivider(),
                      Text(
                        store.timing,
                        style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.hintColor,
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
