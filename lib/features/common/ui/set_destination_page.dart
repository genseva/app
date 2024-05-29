import 'package:deligo/components/custom_button.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class SetDestinationPage extends StatefulWidget {
  const SetDestinationPage({super.key});

  @override
  State<SetDestinationPage> createState() => _SetDestinationPageState();
}

class _SetDestinationPageState extends State<SetDestinationPage> {
  AddressDomain address = AddressDomain(Icons.location_on, "Loading...", "Loading...");

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomMapScaffold(
      pin: Assets.pinsIcLocation1,
      showCenterPin: true,
      onAddressUpdate: (addressDomain) {
        setState(() {
          address = addressDomain;
        });
      },
      bottomChild: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: theme.scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Set Location", style: theme.textTheme.headlineSmall),
            ListTile(
              minVerticalPadding: 10,
              contentPadding: const EdgeInsets.only(top: 10),
              leading: Container(
                padding: const EdgeInsets.all(2),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  address.icon,
                  color: theme.scaffoldBackgroundColor,
                  size: 20,
                ),
              ),
              title: Text(
                address.name,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  address.address,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                ),
              ),
              trailing: Icon(Icons.bookmark, color: theme.hintColor),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Next",
              onTap: () => Navigator.pushNamed(
                context,
                PageRoutes.deliveryDetailsPage,
                arguments: address,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
