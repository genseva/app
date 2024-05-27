import 'package:flutter/material.dart';

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order ID", style: theme.textTheme.bodyMedium),
              Text("FD148HF667", style: theme.textTheme.bodyLarge),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ordered on", style: theme.textTheme.bodyMedium),
              Text("Today, 12:35 PM", style: theme.textTheme.bodyLarge),
            ],
          )
        ],
      ),
    );
  }
}
