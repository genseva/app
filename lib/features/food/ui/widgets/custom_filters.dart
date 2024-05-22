import 'package:deligo/app_config/colors.dart';
import 'package:flutter/material.dart';

class Filter {
  IconData icon;
  String title;

  Filter(this.icon, this.title);
}
// ignore: must_be_immutable
class CustomFilters extends StatefulWidget {
  List<Filter> filters;

  CustomFilters({super.key, required this.filters});

  @override
  State<CustomFilters> createState() => _CustomFiltersState();
}

class _CustomFiltersState extends State<CustomFilters> {
  final List<String> _selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: -4,
      children: List.generate(
        widget.filters.length,
        (index) {
          var isSelected =
              _selectedFilters.contains(widget.filters[index].title);
          return FilterChip(
            selected: isSelected,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            selectedColor: blackColor,
            disabledColor: Theme.of(context).scaffoldBackgroundColor,
            showCheckmark: false,
            avatar: Icon(
              widget.filters[index].icon,
              color: isSelected
                  ? Theme.of(context).scaffoldBackgroundColor
                  : blackColor,
              size: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(color: greyTextColor.withOpacity(0.1)),
            label: Text(
              widget.filters[index].title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isSelected
                        ? Theme.of(context).scaffoldBackgroundColor
                        : null,
                    fontSize: 12,
                  ),
            ),
            onSelected: (value) {
              if (isSelected) {
                _selectedFilters.remove(widget.filters[index].title);
              } else {
                _selectedFilters.add(widget.filters[index].title);
              }
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
