import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderInfoPage extends StatefulWidget {
  const OrderInfoPage({super.key});

  @override
  State<OrderInfoPage> createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {
  late final CartCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<CartCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final AddressDomain address = AddressDomain.list.first;
    return BlocBuilder<CartCubit, List<ProductDomain>>(
      builder: (context, state) {
        return CustomScaffold(
            image: Assets.headerHeaderFood,
            title: '',
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 6),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                        color: theme.primaryColor,
                      ),
                      child: Row(
                        children: [
                          Image.asset(Assets.assetsDelivery, scale: 4),
                          Text(
                            "Deliveryman Arriving in 20 mins",
                            style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ));
      },
    );
  }
}
