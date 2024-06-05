import 'package:deligo/app_config/colors.dart';
import 'package:deligo/components/add_button.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/cart/model/coupon_domain.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/order/ui/widgets/pay_total_card.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final CartCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<CartCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final AddressDomain address = AddressDomain.list.first;
    return BlocBuilder<CartCubit, List<ProductDomain>>(
      builder: (context, products) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_cubit.store?.name ?? ""),
            centerTitle: false,
            backgroundColor: Colors.white,
          ),
          backgroundColor: cardColor,
          body: ListView(
            children: [
              Container(color: theme.scaffoldBackgroundColor, child: const CustomDivider()),
              ListTile(
                tileColor: theme.scaffoldBackgroundColor,
                minVerticalPadding: 10,
                leading: Icon(
                  address.icon,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _cubit.store?.type == "shop"
                            ? "Deliver to ${address.name} "
                            : "Deliver to ${address.name}  | ${_cubit.store?.deliveryTime} min",
                        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (_cubit.store?.type == "shop")
                      Text(
                        "CHANGE",
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold, color: theme.primaryColor),
                      ),
                  ],
                ),
                subtitle: Text(
                  address.address,
                  style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      minVerticalPadding: 10,
                      leading: product.isVeg != null
                          ? Image.asset(
                              product.isVegetarian ? Assets.foodFoodVeg : Assets.foodFoodNonveg,
                              height: 16,
                              width: 40,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                product.image,
                                height: 40,
                              ),
                            ),
                      title: Text(
                        product.name,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        r"$" " ${product.price.toStringAsFixed(2)}",
                        style: theme.textTheme.titleSmall?.copyWith(),
                      ),
                      trailing: AddItemButton(store: _cubit.store!, product: product),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemCount: products.length,
                ),
              ),
              const SizedBox(height: 2),
              if(_cubit.store?.type =="food")
                Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.assignment,
                    color: greyTextColor,
                    size: 18,
                  ),
                  title: Text(
                    AppLocalizations.of(context).addInstructionToRestaurant,
                    style: theme.textTheme.titleSmall?.copyWith(color: theme.hintColor),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (_cubit.coupon == null)
                ListTile(
                  tileColor: theme.scaffoldBackgroundColor,
                  minVerticalPadding: 10,
                  leading: Icon(
                    Icons.discount_sharp,
                    color: theme.hintColor,
                    size: 18,
                  ),
                  title: Text(
                    AppLocalizations.of(context).applyCoupon,
                    style: theme.textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    "Save up to 20% off",
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: theme.hintColor,
                  ),
                  onTap: () => _cubit.updateCoupon(CouponDomain.list.first),
                )
              else
                ListTile(
                  tileColor: theme.scaffoldBackgroundColor,
                  minVerticalPadding: 10,
                  leading: Icon(
                    Icons.discount_sharp,
                    color: theme.primaryColor,
                    size: 18,
                  ),
                  title: Text(
                    "${_cubit.coupon!.id} Applied",
                    style: theme.textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    _cubit.coupon!.description,
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                  ),
                  trailing: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onTap: () => _cubit.removeCoupon(),
                ),
              const SizedBox(height: 8),
              PayTotalCard(_cubit),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            height: 70,
            child: ListTile(
              title: Text(
                r"$" " ${_cubit.getCartTotalWithCharges().toStringAsFixed(2)}",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(AppLocalizations.of(context).viewDetailedBill,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.primaryColor,
                  )),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, PageRoutes.paymentPage);
                },
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xffebebeb)),
                        borderRadius: BorderRadius.circular(10))),
                    padding: WidgetStateProperty.all(const EdgeInsets.all(20)),
                    elevation: WidgetStateProperty.all(0),
                    backgroundColor: WidgetStateProperty.all(theme.primaryColor)),
                child: Text(
                  AppLocalizations.of(context).proceedToPay,
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
