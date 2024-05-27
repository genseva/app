import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

class PayTotalCard extends StatelessWidget {
  const PayTotalCard(this.cubit, {super.key, this.isPaid = false});

  final CartCubit cubit;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Item Total",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              Text(
                r"$" " ${cubit.getCartTotal().toStringAsFixed(2)}",
                style: theme.textTheme.bodyMedium,
              )
            ],
          ),
          const CustomDivider(),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Delivery Fee",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              Text(
                "+ "r"$" " ${cubit.deliveryCharges.toStringAsFixed(2)}",
                style: theme.textTheme.bodyMedium,
              )
            ],
          ),
          const CustomDivider(),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Taxes & Charges",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              Text(
                "+ "r"$" " ${cubit.taxes.toStringAsFixed(2)}",
                style: theme.textTheme.bodyMedium,
              )
            ],
          ),
          const CustomDivider(),
          if (cubit.coupon != null) ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Discount",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Text(
                  "- "r"$" " ${cubit.getDiscount().toStringAsFixed(2)}",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const CustomDivider(),
          ],
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                isPaid ? "Paid via GoWallet" :  "To Pay",
                  style: theme.textTheme.bodyLarge?.copyWith(color: isPaid? theme.primaryColor: Colors.black),
                ),
              ),
              Text(
                r"$" " ${cubit.getCartTotalWithCharges().toStringAsFixed(2)}",
                style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
