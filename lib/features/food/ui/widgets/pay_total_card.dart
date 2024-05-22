import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

class PayTotalCard extends StatelessWidget {
  const PayTotalCard(this.cubit, {super.key});

  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Item Total",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(r"$" " ${cubit.getCartTotal().toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          const CustomDivider(),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Delivery Fee",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(r"$"" ${cubit.deliveryCharges.toStringAsFixed(2)}", style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          const CustomDivider(),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Taxes & Charges",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(r"$"" ${cubit.taxes.toStringAsFixed(2)}", style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          const CustomDivider(),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Text(
                  "To Pay",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Text(
                r"$"" ${cubit.getCartTotalWithCharges().toStringAsFixed(2)}",
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
