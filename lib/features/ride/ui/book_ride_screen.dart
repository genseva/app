import 'package:deligo/components/custom_app_bar.dart';
import 'package:deligo/components/custom_divider.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class BookRideScreen extends StatelessWidget {
  const BookRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: CustomAppBar(
          title: locale.whereToGo,
          image: Assets.headerHeaderRide,
          appbarBottom: PositionedDirectional(
            bottom: 0,
            start: 10,
            end: 10,
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
