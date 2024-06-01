import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/account/model/address.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:deligo/generated/assets.dart';
import 'package:flutter/material.dart';

class AddNewAddressPage extends StatefulWidget {
  const AddNewAddressPage({super.key});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  AddressDomain address = AddressDomain(Icons.location_on, "Loading...", "Loading...");
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomMapScaffold(
      pin: Assets.pinsIcLocation,
      showCenterPin: true,
      onAddressUpdate: (addressDomain) {
        setState(() {
          address = addressDomain;
        });
      },
      topChild: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            prefixIcon: const Icon(Icons.search),
            onTap: () {},
            bgColor: theme.scaffoldBackgroundColor,
            hintText: "Search Location",
          ),
        ),
      ),
      bottomChild: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          color: theme.scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add New Address", style: theme.textTheme.headlineSmall),
            ListTile(
              minVerticalPadding: 10,
              contentPadding: const EdgeInsets.only(top: 10),
              leading: Image.asset(Assets.pinsIcLocation, height: 35),
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
            ),

            const SizedBox(height: 10),
            SizedBox(
              height:60 ,
              child: ListView.separated(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: AddressDomain.list.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 25),
                  itemBuilder: (context, index) {
                  var type = AddressDomain.list[index];
                  return CustomButton(
                    prefixIcon: type.icon,
                    text: type.name,
                    textColor: Colors.black54,
                    prefixIconColor: theme.primaryColor,
                    buttonColor: index == _selectedIndex? const Color(0xffE0FEE4) : theme.scaffoldBackgroundColor,
                    onTap: (){
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );

              }),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Next",
              onTap: (){
                Navigator.pop(context);
              },
            )

          ],
        ),
      ),
    );
  }
}
