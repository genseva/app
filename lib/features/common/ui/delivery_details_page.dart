import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DeliveryDetailsPage extends StatefulWidget {
  const DeliveryDetailsPage({super.key});

  @override
  State<DeliveryDetailsPage> createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  final List<(IconData, String)> _packageTypes = [
    (Icons.person_pin_rounded, "Document"),
    (Icons.restaurant_menu, "Food"),
    (Icons.medication_rounded, "Medicine"),
    (Icons.menu_book_sharp, "Books"),
    (Icons.local_grocery_store, "Grocery"),
    (Icons.warning, "Fragile"),
    (Icons.toys, "Toys"),
    (Icons.laptop, "Electronics"),
  ];

  String? _selectedPackage;

  @override
  Widget build(BuildContext context) {
    AddressDomain address = ModalRoute.of(context)?.settings.arguments as AddressDomain;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xffFEFBEE),
        title: const Text("Delivery Details"),
      ),
      body: ListView(
        children: [
          ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            leading: Container(
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
                "USE MY DETAILS",
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
              "Package Type",
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.hintColor),
            ),
          ),
          SizedBox(
            height: 112,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                axisDirection: AxisDirection.right,
                children: _packageTypes
                    .map(
                      (packageType) => ActionChip(
                        avatar: Icon(packageType.$1),
                        label: Text(packageType.$2),
                        padding: const EdgeInsets.all(12),
                        color: WidgetStateProperty.all(
                          _selectedPackage == packageType.$2
                              ? theme.primaryColor.withOpacity(0.1)
                              : theme.cardColor,
                        ),
                        side: BorderSide(
                          color: _selectedPackage == packageType.$2
                              ? theme.primaryColor.withOpacity(0.2)
                              : Colors.grey.shade200,
                        ),
                        labelStyle: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        iconTheme: IconThemeData(
                          color: _selectedPackage == packageType.$2
                              ? theme.primaryColor
                              : theme.primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _selectedPackage = packageType.$2;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomButton(
        text: "Next",
        margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
    );
  }
}
