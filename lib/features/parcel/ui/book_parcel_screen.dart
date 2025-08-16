import 'package:genseva/components/custom_scaffold.dart';
import 'package:genseva/features/common/model/delivery_type.dart';
import 'package:genseva/features/common/ui/cab_child.dart';
import 'package:genseva/generated/assets.dart';
import 'package:genseva/generated/l10n.dart';
import 'package:flutter/material.dart';

class BookParcelScreen extends StatelessWidget {
  const BookParcelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return CustomScaffold(
      image: Assets.headerHeaderPackage,
      title: locale.whereToDeliver,
      bgColor: Theme.of(context).disabledColor,
      child: const CabChild(type: DeliveryType.delivery),
    );
  }
}
