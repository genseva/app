import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:flutter/material.dart';

class PickupDetailsPage extends StatefulWidget {
  const PickupDetailsPage({super.key});

  @override
  State<PickupDetailsPage> createState() => _PickupDetailsPageState();
}

class _PickupDetailsPageState extends State<PickupDetailsPage> {
  final List<(String, String)> _packageWeights = [
    ("Small", "Max. 3-5 kg"),
    ("Medium", "Max. 5-10 kg"),
    ("Large", "Max. 10-20 kg"),
  ];

  String? _selectedPackage;

  @override
  Widget build(BuildContext context) {
    AddressDomain address = ModalRoute.of(context)?.settings.arguments as AddressDomain;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xffF1FFF2),
        title: const Text("Pickup Details"),
      ),
      body: ListView(
        children: [
          ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            leading: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                address.icon,
                color: theme.scaffoldBackgroundColor,
                size: 20,
              ),
            ),
            minVerticalPadding: 16,
            title: Text(
              address.name,
              style:
                  theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, height: 0.4),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                address.address,
                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),
            ),
            trailing: FittedBox(
              child: Text(
                "EDIT",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CustomTextField(
            margin: const EdgeInsets.all(16),
            prefixIcon: Icon(Icons.assistant, color: theme.hintColor),
            hintText: "Enter nearby landmark",
          ),
          Divider(thickness: 8, color: theme.cardColor),
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                "Recipient",
                style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
              ),
              const Spacer(),
              Text(
                "CLEAR DETAILS",
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
              ),
              const SizedBox(width: 16),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: CustomTextField(
                  margin: EdgeInsetsDirectional.fromSTEB(16, 16, 8, 16),
                  prefixIcon: Icon(Icons.person_pin_rounded),
                  hintText: "Enter Recipient's Name",
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.person),
                iconSize: 30,
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  backgroundColor: WidgetStateProperty.all(theme.primaryColor.withOpacity(0.1)),
                  foregroundColor: WidgetStateProperty.all(theme.primaryColor),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const CustomTextField(
            margin: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            prefixIcon: Icon(Icons.phone_android),
            hintText: "Enter Phone Number",
          ),
          Divider(thickness: 8, color: theme.cardColor),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Select Package Weight",
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
            ),
          ),
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _packageWeights.length,
            itemBuilder: (context, index) {
              final packageWeight = _packageWeights[index];
              return RadioListTile(
                value: packageWeight.$1,
                groupValue: _selectedPackage,
                activeColor: theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: _selectedPackage == packageWeight.$1
                        ? theme.primaryColor.withOpacity(0.2)
                        : Colors.grey.shade200,
                  ),
                ),
                tileColor: theme.scaffoldBackgroundColor,
                selected: _selectedPackage == packageWeight.$1,
                selectedTileColor: theme.primaryColor.withOpacity(0.1),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      packageWeight.$1,
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      packageWeight.$2,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    _selectedPackage = value;
                  });
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          )
        ],
      ),
      bottomNavigationBar: const CustomButton(
        text: "Next",
        margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
    );
  }
}
