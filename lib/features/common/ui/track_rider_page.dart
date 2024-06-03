import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/features/cart/cubit/cart_cubit.dart';
import 'package:deligo/features/common/model/delivery_type.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:deligo/features/order/ui/widgets/address_card.dart';
import 'package:deligo/features/order/ui/widgets/get_rating_card.dart';
import 'package:deligo/features/order/ui/widgets/order_header_card.dart';
import 'package:deligo/features/order/ui/widgets/order_info_card.dart';
import 'package:deligo/features/order/ui/widgets/service_man_card.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackRiderPage extends StatefulWidget {
  const TrackRiderPage({super.key});

  @override
  State<TrackRiderPage> createState() => _TrackRiderPageState();
}

class _TrackRiderPageState extends State<TrackRiderPage> {
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(
      const Duration(seconds: 7),
      () {
        setState(() {
          _isCompleted = true;
        });
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context);
    DeliveryType type = ModalRoute.of(context)?.settings.arguments as DeliveryType;
    return BlocBuilder<CartCubit, List<ProductDomain>>(
      builder: (context, state) {
        return CustomMapScaffold(
          bottomSheetInitialSize: _isCompleted ? 0.16 : null,
          showBackButton: true,
          bottomSheetBuilder: (context, controller) {
            return ListView(
              controller: controller,
              shrinkWrap: true,
              children: [
                if (_isCompleted)
                  OrderHeaderCard(
                      image: type.image,
                      title: "Ride",
                      subTitle: AppLocalizations.of(context).tripCompleted)
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
                                text: "Driver Arriving in ",
                                children: [
                                  TextSpan(
                                    text: "10 mins",
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
                      if (_isCompleted) ...[
                        const GetRatingCard(),
                        const SizedBox(height: 10),
                      ],
                      ServiceManCard("Tyota Calya", Assets.reviewerReviewer1, "KLV - 1234"),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          locale.tripDetails,
                          style: theme.textTheme.titleMedium?.copyWith(color: theme.hintColor),
                        ),
                      ),
                      AddressCard(
                        _isCompleted,
                        pickupIcon: Assets.pinsIcLocation,
                        dropIcon: Assets.pinsIcLocation1,
                      ),
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
                                Text(locale.rideCost, style: theme.textTheme.bodyMedium),
                                Text(r"$8.00", style: theme.textTheme.bodyMedium),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const CustomDivider(),
                            Row(
                              children: [
                                Text(locale.paymentMethod, style: theme.textTheme.bodyMedium),
                                const Spacer(),
                                Image.asset(Assets.paymentVecWallet, scale: 4),
                                const SizedBox(width: 10),
                                Text(
                                  locale.wallet,
                                  style:
                                      theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const OrderInfoCard(),
                      const SizedBox(height: 20),
                      if (!_isCompleted)
                        CustomButton(
                          margin: const EdgeInsets.all(30),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          text: "Cancel Order",
                          buttonColor: const Color(0xFFF1D7D6),
                          textColor: Colors.red,
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
