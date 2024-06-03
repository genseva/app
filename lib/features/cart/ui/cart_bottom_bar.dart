import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar(this.store, {super.key});

  final StoreDomain store;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final cubit = context.read<CartCubit>()..store = store;
    return BlocBuilder<CartCubit, List<ProductDomain>>(
      builder: (context, products) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PageRoutes.checkoutPage);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            height: products.isEmpty ? 0 : 60,
            margin: products.isEmpty ? EdgeInsets.zero : const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.primaryColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: products.isNotEmpty
                ? Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${products.length} Item(s) • "
                            r"$"
                            "${cubit.getCartTotal().toStringAsFixed(2)}",
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            AppLocalizations.of(context).extraChargesMayApply,
                            style:
                                theme.textTheme.labelSmall?.copyWith(color: Colors.grey.shade300),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.shopping_basket_outlined, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        AppLocalizations.of(context).viewCart,
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
        );
      },
    );
  }
}
