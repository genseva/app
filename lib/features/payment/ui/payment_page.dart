import 'package:deligo/features/payment/models/payment_category.dart';
import 'package:deligo/features/payment/models/payment_page_data.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "${data.numberOfItems} items",
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.unselectedWidgetColor),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: theme.primaryColor.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.local_offer, color: theme.primaryColor, size: 20),
                const SizedBox(width: 20),
                Text(
                  "${data.coupon} offer applied on the bill",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final category = PaymentCategory.list[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    category.title,
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.unselectedWidgetColor),
                  ),
                  ...category.paymentMethods.map(
                    (paymentMethod) {
                      bool isCard = paymentMethod.title.contains("Card");
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        height: 54,
                        child: Row(
                          children: [
                            Align(
                              alignment: isCard ? Alignment.bottomCenter : Alignment.center,
                              child: Image.asset(
                                paymentMethod.icon,
                                width: isCard ? 40 : 32,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              paymentMethod.title,
                              style:
                                  theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: PaymentCategory.list.length,
          )
        ],
      ),
    );
  }
}
