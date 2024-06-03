import 'package:deligo/components/custom_button.dart';
import 'package:deligo/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectServiceDate extends StatefulWidget {
  const SelectServiceDate({super.key});

  @override
  State<SelectServiceDate> createState() => _SelectServiceDateState();
}

class _SelectServiceDateState extends State<SelectServiceDate> {
  List<Map<String, String>> generateNextWeekDates() {
    DateTime today = DateTime.now();
    List<Map<String, String>> nextWeekDates = [];

    for (int i = 1; i <= 7; i++) {
      DateTime nextDate = today.add(Duration(days: i));
      String formattedDate = DateFormat('dd').format(nextDate);
      String dayOfWeek = DateFormat('EEE').format(nextDate);
      nextWeekDates.add({'date': formattedDate, 'day': dayOfWeek});
    }

    return nextWeekDates;
  }

  var selectedDateIndex = 2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Map<String, String>> dates = generateNextWeekDates();

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
                          child: Text("Select Date",
                              style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey)),
                        ),
                        SizedBox(
                          height: 80,
                          child: ListView.separated(
                              padding: const EdgeInsets.only(left: 16, bottom: 16),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDateIndex = index;
                                    });
                                  },
                                  child: SizedBox(
                                    width: 60,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: theme.hintColor),
                                        color: selectedDateIndex == index
                                            ? theme.primaryColor
                                            : Colors.white,
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                      child: Center(
                                          child: Column(
                                        children: [
                                          Text(
                                            dates[index]['date']!,
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: selectedDateIndex == index
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                          Text(
                                            dates[index]['day']!,
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                color: selectedDateIndex == index
                                                    ? theme.disabledColor
                                                    : theme.hintColor),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(width: 10),
                              itemCount: dates.length),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          child: Text("Available Time",
                              style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey)),
                        ),
                        SizedBox(
                          height: 90,
                          child: ListView.separated(
                              padding: const EdgeInsets.only(left: 16, bottom: 16),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDateIndex = index;
                                    });
                                  },
                                  child: SizedBox(
                                    width: 70,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: theme.hintColor),
                                        color: selectedDateIndex == index
                                            ? theme.primaryColor
                                            : Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                          child: Column(
                                        children: [
                                          Text(
                                            dates[index]['date']!,
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: selectedDateIndex == index
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                          Text(
                                            dates[index]['day']!,
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                color: selectedDateIndex == index
                                                    ? theme.disabledColor
                                                    : theme.hintColor),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(width: 10),
                              itemCount: dates.length),
                        ),
                        const Spacer(),
                        const SelectServiceDate(),
                      ],
                    );
                  });
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
                      style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text("23 June, 10:00 AM",
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
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
