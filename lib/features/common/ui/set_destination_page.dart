import 'package:deligo/components/custom_button.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';

class SetDestinationPage extends StatelessWidget {
  const SetDestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var address = AddressDomain.recentSearches.first;
    return CustomMapScaffold(
      pin: Assets.pinsIcLocation1,
      bottomChild: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Set Location", style: theme.textTheme.headlineSmall),
            ListTile(
              minVerticalPadding: 10,
              contentPadding: const EdgeInsets.only(top: 10),
              leading: Image.asset(Assets.pinsIcLocation1, height: 30),
              title: Text(address.name,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(address.address,
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
              ),
              trailing: Icon(Icons.bookmark, color: theme.hintColor),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Next",
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
