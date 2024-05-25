import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/features/common/model/delivery_type.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class CabChild extends StatelessWidget {
  const CabChild({super.key, required this.type});

  final DeliveryType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
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
                    if (type != DeliveryType.delivery) ...[
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: theme.primaryColor,
                            radius: 16,
                            foregroundColor: theme.scaffoldBackgroundColor,
                            child: const Icon(Icons.location_on, size: 16),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: CustomTextField(
                              bgColor: Colors.transparent,
                              showBorder: false,
                              hintText: "Your location",
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 54.0),
                        child: CustomDivider(),
                      ),
                    ],
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
                            bgColor: Colors.transparent,
                            showBorder: false,
                            hintText: type != DeliveryType.delivery
                                ? "Search for a destination"
                                : "Search delivery location",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.whereToPage, arguments: type);
                      },
                      buttonColor: theme.scaffoldBackgroundColor,
                      prefixIcon: Icons.pin_drop,
                      prefixIconColor: theme.primaryColor,
                      text: "Select on map",
                      textColor: theme.hintColor,
                      textStyle: theme.textTheme.bodyMedium,
                    ),
                  ),
                  if (type != DeliveryType.delivery) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.whereToPage, arguments: type);
                        },
                        buttonColor: theme.scaffoldBackgroundColor,
                        prefixIcon: Icons.add_circle,
                        prefixIconColor: Colors.yellow.shade700,
                        text: "Add a destination",
                        textColor: theme.hintColor,
                        textStyle: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ] else
                    const Expanded(child: SizedBox())
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: theme.scaffoldBackgroundColor,
            padding: const EdgeInsets.all(20),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Text(
                  "Saved Locations",
                  style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                ),
                _addressList(AddressDomain.list, theme),
                Text(
                  "Recent Searches",
                  style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
                ),
                _addressList(AddressDomain.recentSearches, theme),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _addressList(List<AddressDomain> addresses, ThemeData theme) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var address = addresses[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              address.icon,
              color: theme.hintColor,
              size: 20,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  style:
                      theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, height: 1),
                ),
                const SizedBox(height: 6),
                Text(
                  address.address,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                ),
              ],
            )
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: addresses.length,
    );
  }
}
