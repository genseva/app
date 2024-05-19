import 'package:deligo/components/custom_app_bar.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class BookParcelScreen extends StatelessWidget {
  const BookParcelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: CustomAppBar(
          title: "Where to deliver?",
          image: Assets.headerHeaderPackage,
          appbarBottom: Positioned(
            bottom: 0,
            left: 8,
            right: 0,
            child: SizedBox(
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
