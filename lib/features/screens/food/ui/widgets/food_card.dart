import 'package:deligo/features/screens/food/model/food_domain.dart';
import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatefulWidget {
  const FoodCard(this.food, {super.key});

  final FoodDomain food;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  FoodDomain get food => widget.food;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.24,
      margin: const EdgeInsets.only(bottom: 32.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Image.asset(
                        food.isVeg ? Assets.foodFoodVeg : Assets.foodFoodNonveg,
                        height: 16,
                      ),
                    ),
                    Text(
                      food.name,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      r"$" + food.price.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                    ),
                    Text(
                      food.isCustomizable ? "Customize" : "",
                      textAlign: TextAlign.end,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Image.asset(
                food.image,
                height: MediaQuery.of(context).size.width * 0.24,
                width: MediaQuery.of(context).size.width * 0.24,
              ),
            ],
          ),
          PositionedDirectional(
            end: 4,
            bottom: -16,
            child: GestureDetector(
              onTap: () {
                if (food.quantity == 0) {
                  food.quantity++;
                  food.cartTotal = food.cartTotal + food.price;
                }
                setState(() {});
              },
              child: Container(
                height: 32,
                width: MediaQuery.of(context).size.width * 0.22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Theme.of(context).primaryColor),
                  color: food.quantity == 0
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).primaryColor,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (food.quantity > 0) ...[
                      GestureDetector(
                        onTap: () {
                          food.cartTotal = food.cartTotal - food.price;
                          food.quantity--;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          food.quantity.toString(),
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          food.cartTotal = food.cartTotal + food.price;
                          food.quantity++;
                          setState(() {});
                        },
                        child: const Icon(Icons.add,
                            size: 16, color: Colors.white),
                      ),
                    ] else
                      Text(
                        "Add",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
