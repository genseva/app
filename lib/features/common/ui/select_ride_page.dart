import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/common/model/delivery_type.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:deligo/features/payment/ui/payment_type_list.dart';
import 'package:flutter/material.dart';

class SelectRidePage extends StatefulWidget {
  const SelectRidePage({super.key});

  @override
  State<SelectRidePage> createState() => _SelectRidePageState();
}

class _SelectRidePageState extends State<SelectRidePage> {
  int _selectedRide = 0;

  @override
  Widget build(BuildContext context) {
    (DeliveryType, String) args =
        ModalRoute.of(context)?.settings.arguments as (DeliveryType, String);
    DeliveryType type = args.$1;
    final theme = Theme.of(context);
    return CustomMapScaffold(
      topChild: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.scaffoldBackgroundColor,
                  border: Border.all(color: theme.hintColor.withOpacity(0.3)),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: theme.primaryColor,
                          radius: 16,
                          foregroundColor: theme.scaffoldBackgroundColor,
                          child: const Icon(Icons.location_on, size: 16),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            onTap: () {},
                            bgColor: Colors.transparent,
                            showBorder: false,
                            hintText: "1141 Central Park, Hemilton, ON 3C6",
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.only(start: 54.0),
                      child: CustomDivider(),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.yellow.shade700,
                          radius: 16,
                          foregroundColor: theme.scaffoldBackgroundColor,
                          child: const Icon(Icons.navigation, size: 16),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            onTap: () {},
                            bgColor: Colors.transparent,
                            showBorder: false,
                            hintText: "1141 New Dr. Jersey, NY 3C6",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomChild: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          color: theme.scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            Container(
              width: 70.0,
              height: 3.0,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: theme.hintColor.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 8),
            Text(args.$2, style: theme.textTheme.labelMedium?.copyWith(color: theme.hintColor)),
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: type.rideList.length,
              itemBuilder: (context, index) {
                var ride = type.rideList[index];
                return Container(
                  height: 70,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity - 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: index == _selectedRide
                        ? const Color(0xffF1FFF2)
                        : theme.scaffoldBackgroundColor,
                    border: Border.all(color: theme.hintColor.withOpacity(0.3)),
                  ),
                  child: ListTile(
                    onTap: () {
                      _selectedRide = index;
                      setState(() {});
                    },
                    leading: Image.asset(ride.image, height: 30),
                    title: Text(
                      ride.name,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "${ride.time}   •   ",
                          style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                        ),
                        Text(
                          ride.quantity,
                          style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                        ),
                      ],
                    ),
                    trailing: Text(
                      r"$" + ride.price,
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              },
            ),
            CustomButton(
              margin: const EdgeInsets.all(16),
              text: "Confirm Ride",
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: (context) {
                  return ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:16.0, top: 30),
                            child: Text("Select Payment Method", style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                          ),
                          PaymentTypeList()
                        ],
                      ),
                    ],
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
