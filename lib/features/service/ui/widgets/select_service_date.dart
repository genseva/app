import 'package:deligo/components/custom_button.dart';
import 'package:deligo/features/service/ui/widgets/select_date_list.dart';
import 'package:deligo/features/service/ui/widgets/select_time_list.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectServiceDate extends StatefulWidget {
  const SelectServiceDate({super.key, this.isSheet = true});

  final bool isSheet;

  @override
  State<SelectServiceDate> createState() => _SelectServiceDateState();
}

class _SelectServiceDateState extends State<SelectServiceDate> {



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.dividerColor, width: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.isSheet) {
                showModalBottomSheet(
                  backgroundColor: theme.scaffoldBackgroundColor,
                  context: context,
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          child: Text(
                            "Select Date",
                            style: theme.textTheme.titleSmall?.copyWith(color: theme.hintColor),
                          ),
                        ),
                        const SelectDateList(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          child: Text("Available Time",
                              style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey)),
                        ),
                        const SelectTimeList(),
                        const SelectServiceDate(isSheet: false),
                      ],
                    );
                  },
                );
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: theme.primaryColor, size: 15),
                    const SizedBox(width: 8),
                    Text(
                      "Select Date",
                      style: theme.textTheme.titleSmall?.copyWith(color: theme.hintColor),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  "23 June, 10:00 AM",
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomButton(
            prefixIcon: Icons.assignment_turned_in_outlined,
            prefixIconColor: theme.scaffoldBackgroundColor,
            text: "Send Request",
            onTap: () => Navigator.pushNamed(context, PageRoutes.serviceRequestScreen),
          )
        ],
      ),
    );
  }
}
