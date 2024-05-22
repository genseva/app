import 'package:flutter/material.dart';

class StoreHeadingTile extends StatelessWidget {
  const StoreHeadingTile({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: theme.textTheme.headlineSmall!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall!.copyWith(
          fontSize: 13,
          color: theme.hintColor,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.hintColor.withOpacity(0.2),
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.search,
          color: theme.primaryColorDark,
        ),
      ),
    );
  }
}
