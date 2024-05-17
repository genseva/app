import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/add_button.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/screens/food/ui/widgets/pay_total_card.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/routes/page_routes.dart';
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
        backgroundColor: Colors.white,
      ),
      backgroundColor: cardColor,
      body: Column(
        children: [
          Container(color: Colors.white, child: const CustomDivider()),
          Container(
            color: Colors.white,
            child: ListTile(
              minVerticalPadding: 10,
              leading: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
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
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: ListTile(
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
              trailing: AddItemButton(quantity: 1),
            ),
          ),
          const SizedBox(height: 2),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.assignment,
                color: greyTextColor,
                size: 18,
              ),
              title: Text("Add instruction to restaurant",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: greyTextColor)),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            child: ListTile(
              minVerticalPadding: 10,
              leading: Icon(
                Icons.discount_sharp,
                color: greyTextColor,
                size: 18,
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
          ),
          Container(height: 8, color: Theme.of(context).cardColor),
          Container(color: Colors.white, child: const PayTotalCard())
        ],
      ),
      bottomNavigationBar: Container(
          color: Colors.white,
          height: 70,
          child: ListTile(
            title: Text(
              r"$ 17.00",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text("View detailed bill",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    )),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageRoutes.paymentPage);
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xffebebeb)),
                      borderRadius: BorderRadius.circular(10))),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
              child: Text(
                "Proceed to Pay",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
