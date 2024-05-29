import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/common/model/delivery_type.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:flutter/material.dart';

class SelectRidePage extends StatefulWidget {
  const SelectRidePage({super.key});

  @override
  State<SelectRidePage> createState() => _SelectRidePageState();
}

class _SelectRidePageState extends State<SelectRidePage> {
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
      bottomChild: Stack(
        children: [

        ],
      ),
    );
  }
}
