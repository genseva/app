import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/option_tile.dart';
import 'package:flutter/material.dart';

class SavedAddressesPage extends StatelessWidget {
  const SavedAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<(IconData, String, String)> addresses = [
      (Icons.home, "Home", "656 East Depot Lane Bronx,\nNew York 10460"),
      (Icons.apartment, "Work", "9922 West Linda Rd. Rochester,\nNew York 14609"),
      (Icons.location_on, "Other", "8659 New Dr. Jamestown,\nNew York 14701"),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Saved Addresses",
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var address = addresses[index];
                    return OptionTile(
                      icon: address.$1,
                      title: address.$2,
                      subtitle: address.$3,
                      onTap: () {},
                      bgColor: theme.scaffoldBackgroundColor,
                      iconColor: theme.primaryColor,
                      height: 92,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    );
                  },
                  itemCount: addresses.length,
                ),
              ),
              CustomButton(
                prefixIcon: Icons.add,
                prefixIconColor: theme.scaffoldBackgroundColor,
                text: "Add New Address",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
