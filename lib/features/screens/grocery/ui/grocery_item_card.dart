import 'package:deligo/components/add_button.dart';
import 'package:deligo/features/screens/grocery/models/grocery_domain.dart';
import 'package:flutter/material.dart';

class GroceryItemCard extends StatefulWidget {
   GroceryItemCard(this.item,{super.key});
  GroceryDomain item;

  @override
  State<GroceryItemCard> createState() => _GroceryItemCardState();
}

class _GroceryItemCardState extends State<GroceryItemCard> {
  GroceryDomain get item => widget.item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset( item.image,
            height: 90,
          ),
          Text(item.name,  style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.black45,
          ),),Text(item.quantity,  style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.grey,
          ),),Text(  r"$" + item.price.toStringAsFixed(2),  style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 5),
          AddItemButton(quantity: 0),
        ],
      ),
    );
  }
}
