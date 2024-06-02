import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/wallet/model/transaction_domain.dart';
import 'package:flutter/material.dart';

class OngoingOrderList extends StatelessWidget {
  const OngoingOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          var order = TransactionDomain.ongoingOrder[index];
          return Material(
            color: theme.scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(order.icon),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(order.title),
                    subtitle: Text(
                      "Mart 24x7",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.scaffoldBackgroundColor,
                        border: Border.all(color: theme.hintColor),
                      ),
                      child: Icon(Icons.call, color: theme.primaryColor),
                    ),
                  ),
                  const CustomDivider(),
                  const SizedBox(height: 8),
                  Text("1 x Fresh Food 500g", style: theme.textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Text("1 x Fresh veg 500g", style: theme.textTheme.bodySmall),
                  const SizedBox(height: 8),
                  const CustomDivider(),
                  _buildOrderStatus(theme, index.isEven ? 2 : 3)
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: TransactionDomain.ongoingOrder.length);
  }

  Widget _buildOrderStatus(ThemeData theme, int status) {
    List<IconData> iconList = [
      Icons.thumb_up,
      Icons.store,
      Icons.directions_bike_rounded,
      Icons.home
    ];
    return SizedBox(
      height: 50,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var iconColor = index < status ? theme.primaryColor : theme.scaffoldBackgroundColor;
            var bgColor =
                index < status ? theme.scaffoldBackgroundColor : theme.hintColor.withOpacity(0.3);
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
                border: Border.all(color: iconColor),
              ),
              child: Icon(
                iconList[index],
                color: iconColor,
                size: 14,
              ),
            );
          },
          separatorBuilder: (context, index) {
            var color = index + 1 < status
                ? theme.primaryColor.withOpacity(0.3)
                : theme.hintColor.withOpacity(0.3);
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: SizedBox(
                  height: 2,
                  width: 45,
                  child: Divider(
                    thickness: 2,
                    color: color,
                  ),
                ));
          },
          itemCount: iconList.length),
    );
  }
}
