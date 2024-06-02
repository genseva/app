import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/wallet/model/transaction_domain.dart';
import 'package:flutter/material.dart';

class OrderHistoryList extends StatelessWidget {
  const OrderHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          var transaction = TransactionDomain.list[index];
          return Material(
            color: theme.scaffoldBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 4).copyWith(bottom: 0),
                  leading: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(transaction.icon),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(transaction.title),
                  subtitle: Text(
                    "Delivered",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomDivider(),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.hintColor,
                    ),
                    children: [
                      const TextSpan(text: "   2 items   •   "),
                      TextSpan(
                        text: r"$" + transaction.amount.toStringAsFixed(2),
                      ),
                      TextSpan(text: "   •   ${transaction.dateTime}"),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: TransactionDomain.list.length);
  }
}
