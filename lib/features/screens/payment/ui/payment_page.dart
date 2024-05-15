import 'package:deligo/features/screens/payment/models/payment_page_data.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentPageData data = PaymentPageData(2, 17.00, "OFF20");
    // ModalRoute.of(context)?.settings.arguments as PaymentPageData;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Options"),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amount to Pay",
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  r"$" " ${data.amount}",
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "${data.numberOfItems} items",
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.unselectedWidgetColor)
            ),
          ),
        ],
      ),
    );
  }
}
