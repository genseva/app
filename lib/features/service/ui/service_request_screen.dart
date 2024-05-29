import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:deligo/features/order/ui/widgets/get_rating_card.dart';
import 'package:deligo/features/order/ui/widgets/order_header_card.dart';
import 'package:deligo/features/order/ui/widgets/order_info_card.dart';
import 'package:deligo/features/order/ui/widgets/service_man_card.dart';
import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceRequestScreen extends StatefulWidget {
  const ServiceRequestScreen({super.key});

  @override
  State<ServiceRequestScreen> createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
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
      const Duration(seconds: 7),
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
          bottomSheetBuilder: (context, controller) {
            return ListView(
              controller: controller,
              shrinkWrap: true,
              children: [
                if (_isDelivered)
                  const OrderHeaderCard(
                      image: Assets.headerHeaderHandyman,
                      title: "Service",
                      subTitle: "Job Completed")
                else
                  Container(
                    padding: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                      color: theme.primaryColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(Assets.assetsDelivery, scale: 4),
                            Text.rich(
                              TextSpan(
                                text: "Provider has ",
                                children: [
                                  TextSpan(
                                    text: "not confirmed yet.",
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
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          height: 20,
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
                        Container(
                          color: theme.scaffoldBackgroundColor,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Cost for Service", style: theme.textTheme.bodyLarge),
                                  const Spacer(),
                                  Text(
                                    r"$ 7.00",
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: "Pay Now",
                                onTap: () {},
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                      const ServiceManCard(),
                      const SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Booked For", style: theme.textTheme.bodyMedium),
                                Text("23 June, 10:00 AM", style: theme.textTheme.bodyMedium),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const CustomDivider(),
                            if (!_isDelivered) ...[
                              Row(
                                children: [
                                  Text("Estimate Cost", style: theme.textTheme.bodyMedium),
                                  const Spacer(),
                                  Text(r"$5.00", style: theme.textTheme.bodyMedium),
                                  Text("/hr",
                                      style: theme.textTheme.labelSmall
                                          ?.copyWith(color: theme.hintColor)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const CustomDivider(),
                            ],
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 8,
                              minVerticalPadding: 0,
                              leading: Image.asset(
                                Assets.pinsIcLocation,
                                height: 30,
                              ),
                              title: Text(
                                "Service Address",
                                style: theme.textTheme.titleSmall?.copyWith(color: theme.hintColor),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  AddressDomain.list.first.address,
                                  style: theme.textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const OrderInfoCard(),
                      const SizedBox(height: 20),
                      if (!_isDelivered)
                        Row(
                          children: [
                            const SizedBox(width: 25),
                            Expanded(
                              child: CustomButton(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                text: "Cancel Order",
                                buttonColor: const Color(0xFFF1D7D6),
                                textColor: Colors.red,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomButton(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                text: "My Orders",
                                buttonColor: const Color(0xFFB8EDB9),
                                textColor: theme.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 25),
                          ],
                        ),
                      const SizedBox(height: 25),
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
