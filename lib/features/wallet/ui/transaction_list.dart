import 'package:deligo/features/wallet/model/transaction_domain.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.list});

  final List<TransactionDomain> list;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        var transaction = list[index];
        bool isTopUp = transaction.title.toLowerCase().contains("top up");
        bool isCard = transaction.title.toLowerCase().contains("card");
        return Material(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            leading: Container(
              height: 52,
              width: 52,
              padding: isCard ? const EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0) : null,
              decoration: isCard
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.disabledColor,
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(transaction.icon),
                        fit: BoxFit.cover,
                      ),
                    ),
              child: isTopUp ? Image.asset(transaction.icon) : null,
            ),
            title: Text(transaction.title),
            subtitle: Text(
              transaction.dateTime,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.hintColor,
              ),
            ),
            trailing: Text(
              r"$" + transaction.amount.toStringAsFixed(2),
              style: theme.textTheme.bodySmall?.copyWith(
                color: isTopUp ? theme.primaryColor : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: theme.scaffoldBackgroundColor,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: list.length,
    );
  }
}
