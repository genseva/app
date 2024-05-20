import 'package:deligo/components/custom_scaffold.dart';
import 'package:deligo/features/common/cab_child.dart';
import 'package:deligo/generated/assets.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class BookCabScreen extends StatelessWidget {
  const BookCabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return CustomScaffold(
      image: Assets.headerHeaderCab,
      title: locale.whereToGo,
      bgColor: Theme.of(context).disabledColor,
      child: const CabChild(),
    );
  }
}
