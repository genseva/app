import 'package:deligo/components/custom_button.dart';
import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:deligo/features/order/ui/widgets/address_card.dart';
import 'package:deligo/features/order/ui/widgets/deliveryman_card.dart';
import 'package:deligo/features/order/ui/widgets/get_rating_card.dart';
import 'package:deligo/features/order/ui/widgets/order_header_card.dart';
import 'package:deligo/features/order/ui/widgets/order_info_card.dart';
import 'package:deligo/features/order/ui/widgets/pay_total_card.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderInfoPage extends StatefulWidget {
  const OrderInfoPage({super.key});

  @override
  State<OrderInfoPage> createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {
  late final CartCubit _cubit;
  bool _isDelivered = false;

  @override
  void initState() {
    _cubit = context.read<CartCubit>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(() {
          _isDelivered = true;
        });
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CartCubit, List<ProductDomain>>(
      builder: (context, state) {
        return CustomMapScaffold(
          bottomSheetInitialSize: _isDelivered ? 0.16 : null,
          showBackButton: true,
          onBackTap: (){
            Navigator.pushNamedAndRemoveUntil(context, PageRoutes.bottomNavigation, (r) => false);
          },
          bottomSheetBuilder: (context, controller) {
            return ListView(
              controller: controller,
              shrinkWrap: true,
              children: [
                if (_isDelivered)
                  if (_cubit.store?.type == "food")
                    const OrderHeaderCard(
                      image: Assets.headerHeaderFood,
                      title: "Food",
                      subTitle: "Food Delivered",
                    )
                  else if (_cubit.store?.type == "grocery")
                    const OrderHeaderCard(
                      image: Assets.headerHeaderGrocery,
                      title: "Grocery",
                      subTitle: "Grocery Delivered",
                    )
                  else if (_cubit.store?.type == "shop")
                    const OrderHeaderCard(
                      image: Assets.headerHeaderEcommerce,
                      title: "Shopping",
                      subTitle: "Item(s) Delivered",
                    )
                  else if (_cubit.store?.type == "medicine")
                    const OrderHeaderCard(
                      image: Assets.headerHeaderMedicine,
                      title: "Medicine",
                      subTitle: "Medicines Delivered",
                    )
                  else
                    const SizedBox()
                else
                  Container(
                    padding: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      color: theme.primaryColor,
                    ),
                    child: Row(
                      children: [
                        Image.asset(Assets.assetsDelivery, scale: 4),
                        Text.rich(
                          TextSpan(
                            text: "Deliveryman arriving in ",
                            children: [
                              TextSpan(
                                text: "20 mins",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: theme.scaffoldBackgroundColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(color: theme.scaffoldBackgroundColor),
                        ),
                      ],
                    ),
                  ),
                ColoredBox(
                  color: theme.disabledColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_isDelivered) ...[
                        const GetRatingCard(),
                        const SizedBox(height: 10),
                      ],
                      DeliverymanCard(_isDelivered),
                      const SizedBox(height: 10),
                      AddressCard(_isDelivered, store: _cubit.store!),
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
                              leading: product.isVeg != null
                                  ? Image.asset(
                                      product.isVegetarian
                                          ? Assets.foodFoodVeg
                                          : Assets.foodFoodNonveg,
                                      height: 16,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        product.image,
                                        height: 40,
                                      ),
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
                                    style: theme.textTheme.titleSmall
                                        ?.copyWith(color: theme.hintColor),
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
                      if (!_isDelivered)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                          child: CustomButton(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            text: AppLocalizations.of(context).cancelOrder,
                            buttonColor: const Color(0xFFF1D7D6),
                            textColor: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
