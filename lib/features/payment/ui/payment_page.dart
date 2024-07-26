import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/payment/ui/payment_type_list.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final cubit = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).paymentOptions),
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
                  AppLocalizations.of(context).amountToPay,
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  r"$" " ${cubit.getCartTotalWithCharges().toStringAsFixed(2)}",
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "${cubit.state.length} items",
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
                  "OFF20 offer applied on the bill",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const PaymentTypeList(),
        ],
      ),
    );
  }
}
