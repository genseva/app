import 'package:deligo/app_config/app_config.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/features/common/model/delivery_type.dart';
import 'package:deligo/features/order/ui/custom_map_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart';

class WhereToPage extends StatelessWidget {
  const WhereToPage({super.key});

  @override
  Widget build(BuildContext context) {
    (DeliveryType, String) args =
        ModalRoute.of(context)?.settings.arguments as (DeliveryType, String);
    DeliveryType type = args.$1;
    final theme = Theme.of(context);
    return CustomMapScaffold(
      bottomChild: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              type.image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    type.title,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomTextField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow.shade700,
                        radius: 5,
                        foregroundColor: theme.scaffoldBackgroundColor,
                        child: const Icon(Icons.navigation, size: 16),
                      ),
                    ),
                    onTap: () => _getPrediction(context),
                    bgColor: theme.scaffoldBackgroundColor,
                    hintText: args.$2,
                    readOnly: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getPrediction(BuildContext context) async {
    Prediction? prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey: AppConfig.apiKey,
      language: 'en',
      mode: Mode.fullscreen,
      cursorColor: Theme.of(context).cardColor,
      resultTextStyle: Theme.of(context).textTheme.labelLarge,
      textStyle: Theme.of(context).textTheme.labelLarge,
    );
    if (prediction != null) Navigator.pop(context);
  }
}
