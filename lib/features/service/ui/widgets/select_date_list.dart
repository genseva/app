import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateList extends StatefulWidget {
  const SelectDateList({super.key});

  @override
  State<SelectDateList> createState() => _SelectDateListState();
}

class _SelectDateListState extends State<SelectDateList> {
  int _selectedDateIndex = 2;

  late final List<Map<String, String>> _dates;

  @override
  void initState() {
    _dates = generateNextWeekDates();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 16, bottom: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDateIndex = index;
              });
            },
            child: SizedBox(
              width: 60,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.hintColor),
                  color: _selectedDateIndex == index
                      ? theme.primaryColor
                      : theme.scaffoldBackgroundColor,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      _dates[index]['date']!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: _selectedDateIndex == index ? Colors.white : Colors.black),
                    ),
                    Text(
                      _dates[index]['day']!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color:
                              _selectedDateIndex == index ? theme.disabledColor : theme.hintColor),
                    ),
                  ],
                )),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: _dates.length,
      ),
    );
  }
}
