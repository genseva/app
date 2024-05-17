import 'package:deligo/components/add_button.dart';
import 'package:deligo/features/screens/cart/model/food_domain.dart';
import 'package:flutter/material.dart';

class GroceryItemCard extends StatelessWidget {
  const GroceryItemCard(this.item, {super.key});

  final FoodDomain item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(item.image, height: 90),
          Text(
            item.name,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black45,
                ),
          ),
          if (item.cartQuantity != null)
            Text(
              item.cartQuantity.toString() + (item.unit ?? ""),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          Text(
            r"$" + item.price.toStringAsFixed(2),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          AddItemButton(quantity: 0),
        ],
      ),
    );
  }
}
