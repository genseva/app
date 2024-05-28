import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';

class SelectServiceDate extends StatelessWidget {
  const SelectServiceDate({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.dividerColor, width: 0.2)),
      ),
      child: ListTile(
          onTap: () => Navigator.pushNamed(context, PageRoutes.serviceRequestScreen),
          title: Row(
            children: [
              Icon(Icons.calendar_month_outlined, color: theme.primaryColor, size: 15),
              const SizedBox(width: 8),
              Text("Select Date", style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey)),
            ],
          ),
          subtitle: Text("23 June, 10:00 Am",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          trailing: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.assignment_turned_in,
                  size: 15,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text("Send Request",
                    style: theme.textTheme.titleSmall?.copyWith(color: Colors.white)),
              ],
            ),
          )),
    );
  }
}
