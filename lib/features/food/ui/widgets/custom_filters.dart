import 'package:deligo/app_config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Filter {
  IconData icon;
  String title;

  Filter(this.icon, this.title);
}

class CustomFilters extends StatefulWidget {
  const CustomFilters({super.key, required this.filters});

  final List<Filter> filters;

  @override
  State<CustomFilters> createState() => _CustomFiltersState();
}

class _CustomFiltersState extends State<CustomFilters> {
  final List<String> _selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.only(end: 16),
        scrollDirection: Axis.horizontal,
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          axisDirection: AxisDirection.right,
          children: List.generate(
            widget.filters.length,
                (index) {
              var isSelected = _selectedFilters.contains(widget.filters[index].title);
              return FilterChip(
                selected: isSelected,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                selectedColor: blackColor,
                disabledColor: Theme.of(context).scaffoldBackgroundColor,
                showCheckmark: false,
                padding: const EdgeInsets.all(10),
                avatar: Icon(
                  widget.filters[index].icon,
                  color: isSelected ? Theme.of(context).scaffoldBackgroundColor : blackColor,
                  size: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(color: greyTextColor.withOpacity(0.1)),
                label: Text(
                  widget.filters[index].title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isSelected ? Theme.of(context).scaffoldBackgroundColor : null,
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
        ),
      ),
    );
  }
}
