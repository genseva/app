import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/features/common/ui/cab_child.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class BookRideScreen extends StatelessWidget {
  const BookRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return CustomScaffold(
      image: Assets.headerHeaderRide,
      title: locale.whereToGo,
      bgColor: Theme.of(context).disabledColor,
      child: const CabChild(),
    );
  }
}
