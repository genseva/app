import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectTimeList extends StatefulWidget {
  const SelectTimeList({super.key});

  @override
  State<SelectTimeList> createState() => _SelectTimeListState();
}

class _SelectTimeListState extends State<SelectTimeList> {
  int _selectedTimeIndex = 2;

  late final List<(String, String)> _timeSlots;

  List<(String, String)> generateTimeSlots() {
    DateTime now = DateTime.now();
    DateTime startTime = DateTime(now.year, now.month, now.day, 8, 0, 0);
    DateTime endTime = DateTime(now.year, now.month, now.day, 22, 0, 0);
    Duration step = const Duration(hours: 1);

    List<(String, String)> timeSlots = [];

    while (startTime.isBefore(endTime)) {
      DateTime timeIncrement = startTime.add(step);
      timeSlots
          .add((DateFormat("hh:mm").format(timeIncrement), DateFormat("a").format(timeIncrement)));
      startTime = timeIncrement;
    }

    return timeSlots;
  }

  @override
  void initState() {
    _timeSlots = generateTimeSlots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 16, bottom: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTimeIndex = index;
              });
            },
            child: SizedBox(
              width: 70,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.hintColor),
                  color: _selectedTimeIndex == index ? theme.primaryColor : Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      _timeSlots[index].$1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: _selectedTimeIndex == index ? Colors.white : Colors.black),
                    ),
                    Text(
                      _timeSlots[index].$2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color:
                              _selectedTimeIndex == index ? theme.disabledColor : theme.hintColor),
                    ),
                  ],
                )),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: _timeSlots.length,
      ),
    );
  }
}
