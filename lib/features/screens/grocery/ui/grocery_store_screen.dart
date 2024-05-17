import 'package:deligo/components/custom_field.dart';
import 'package:deligo/components/custom_shadow.dart';
import 'package:deligo/features/screens/food/ui/widgets/custom_info_widget.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class GroceryStoreScreen extends StatelessWidget {
  const GroceryStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Grocery Store",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "Center Park • ",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "1.5 km",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInfoWidget(
                    Icons.directions_bike_outlined, "Delivery in", "20 min"),
                CustomInfoWidget(Icons.watch_later_outlined, "Opening Timing",
                    "08:00 am to 10:00 pm"),
              ],
            ),
          ),
          const Divider(thickness: 0.4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: CustomTextField(
                    hintText: locale.searchItemOrStore,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(Icons.assignment, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const CustomShadow(),
        ],
      ),
    );
  }
}
