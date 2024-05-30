import 'package:deligo/components/option_tile.dart';
import 'package:deligo/features/payment/models/payment_category.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class PaymentTypeList extends StatelessWidget {
  PaymentTypeList({super.key, this.onTap});

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
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
                return OptionTile(
                  image: paymentMethod.icon,
                  title: paymentMethod.title,
                  isCard: isCard,
                  onTap: () {
                    onTap ?? Navigator.pushNamed(context, PageRoutes.orderInfoPage);
                  },
                );
              },
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: PaymentCategory.list.length,
    );
  }
}
