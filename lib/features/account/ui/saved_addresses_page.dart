import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/option_tile.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class SavedAddressesPage extends StatelessWidget {
  const SavedAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                    var address = AddressDomain.list[index];
                    return OptionTile(
                      icon: address.icon,
                      title: address.name,
                      subtitle: address.address,
                      onTap: () {},
                      bgColor: theme.scaffoldBackgroundColor,
                      iconColor: theme.primaryColor,
                      height: 92,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    );
                  },
                  itemCount: AddressDomain.list.length,
                ),
              ),
              CustomButton(
                prefixIcon: Icons.add,
                prefixIconColor: theme.scaffoldBackgroundColor,
                text: "Add New Address",
                onTap: () => Navigator.pushNamed(context, PageRoutes.addNewAddressesPage),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
