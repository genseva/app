import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(this.isDelivered, {super.key});

  final bool isDelivered;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return                     Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(Icons.restaurant_menu_outlined, color: theme.primaryColor),
              const SizedBox(height: 16),
              Icon(Icons.more_vert, color: theme.hintColor, size: 30),
              const SizedBox(height: 16),
              Icon(Icons.home, color: theme.primaryColor),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StoreDomain.foodList.first.name,
                  style:
                  theme.textTheme.titleSmall?.copyWith(color: theme.hintColor),
                ),
                Text(
                  AddressDomain.list[1].address,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  "Delivery Location",
                  style:
                  theme.textTheme.titleSmall?.copyWith(color: theme.hintColor),
                ),
                Text(
                  AddressDomain.list.first.address,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          if(!isDelivered)
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.scaffoldBackgroundColor,
              border: Border.all(color: theme.hintColor),
            ),
            child: Icon(Icons.call, color: theme.primaryColor),
          ),
        ],
      ),
    )
    ;
  }
}
