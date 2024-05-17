import 'package:deligo/components/custom_divider.dart';
import 'package:flutter/material.dart';

class PayTotalCard extends StatefulWidget {
  const PayTotalCard({super.key});

  @override
  State<PayTotalCard> createState() => _PayTotalCardState();
}

class _PayTotalCardState extends State<PayTotalCard> {
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
              Text(r"$ 13.00",
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
              Text(r"$ 2.50", style: Theme.of(context).textTheme.bodyMedium)
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
              Text(r"$ 1.50", style: Theme.of(context).textTheme.bodyMedium)
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
                r"$ 17.00",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
