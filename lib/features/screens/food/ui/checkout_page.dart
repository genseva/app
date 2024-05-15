import 'package:deligo/app_config/colors.dart';
import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monte Carlo Restaurant"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const Divider(thickness: 0.4),
          Container(
            color: Colors.white,
            child: ListTile(
              minVerticalPadding: 10,
              leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
              title: Text(
                "Delivery to Home | 20 min",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "B 101, Nirvana Point, Hemilton",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
            ),
          ),
          Container(height: 10, color: Theme.of(context).cardColor),
          ListTile(
            minVerticalPadding: 10,
            leading: Image.asset(
              Assets.foodFoodVeg,
              height: 16,
            ),
            title: Text(
              "Veg Cheese Sandwich",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              r"$ 5.00",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(),
            ),
            trailing: Container(
              height: 32,
              width: MediaQuery.of(context).size.width * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Theme.of(context).primaryColor),
                color: Theme.of(context).primaryColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...[
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child:
                          const Icon(Icons.add, size: 16, color: Colors.white),
                    ),
                  ]
                ],
              ),
            ),
          ),
          Container(height: 2, color: Theme.of(context).cardColor),
          ListTile(
            leading: Icon(
              Icons.integration_instructions_rounded,
              color: greyTextColor,
            ),
            title: Text("Add instruction to restaurant",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: greyTextColor)),
          ),
          Container(height: 10, color: Theme.of(context).cardColor),
          ListTile(
            minVerticalPadding: 10,
            leading: Icon(
              Icons.discount_sharp,
              color: greyTextColor,
            ),
            title: Text(
              "Apply Coupon",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              "Save up to 20% off",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: greyTextColor),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: greyTextColor,
            ),
          ),
          Container(height: 8, color: Theme.of(context).cardColor),
        ],
      ),
    );
  }
}
