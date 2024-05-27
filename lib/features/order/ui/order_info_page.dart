import 'package:deligo/components/custom_button.dart';
import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:deligo/features/order/ui/widgets/address_card.dart';
import 'package:deligo/features/order/ui/widgets/deliveryman_card.dart';
import 'package:deligo/features/order/ui/widgets/order_info_card.dart';
import 'package:deligo/features/order/ui/widgets/pay_total_card.dart';
import 'package:deligo/generated/assets.dart';
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
    final theme = Theme.of(context);
    return BlocBuilder<CartCubit, List<ProductDomain>>(
      builder: (context, state) {
        return CustomMapScaffold(
          bottomSheetBuilder: (context, controller) => ListView(
            controller: controller,
            shrinkWrap: true,
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
                      "Delivery man Arriving in 20 mins",
                      style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
              ColoredBox(
                color: theme.disabledColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DeliverymanCard(),
                    const SizedBox(height: 10),
                    const AddressCard(),
                    const SizedBox(height: 10),
                    const OrderInfoCard(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Ordered Item(s)",
                        style: theme.textTheme.titleMedium?.copyWith(color: theme.hintColor),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final product = state[index];
                          return ListTile(
                            minVerticalPadding: 10,
                            leading: Image.asset(
                              product.isVegetarian ? Assets.foodFoodVeg : Assets.foodFoodNonveg,
                              height: 16,
                            ),
                            title: Row(
                              children: [
                                Text(
                                  product.name,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "  x ${product.quantity}",
                                  style:
                                      theme.textTheme.titleSmall?.copyWith(color: theme.hintColor),
                                ),
                              ],
                            ),
                            trailing: Text(
                              r"$" " ${product.price.toStringAsFixed(2)}",
                              style: theme.textTheme.titleSmall?.copyWith(),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: state.length,
                      ),
                    ),
                    const SizedBox(height: 10),
                    PayTotalCard(_cubit, isPaid: true),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      child: CustomButton(
                        onTap: () => Navigator.pop(context),
                        text: "Cancel Order",
                        buttonColor: const Color(0xFFF1D7D6),
                        textColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
