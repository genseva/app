import 'package:flutter/material.dart';

class OrderHeaderCard extends StatelessWidget {
  const OrderHeaderCard(
      {super.key, required this.image, required this.title, required this.subTitle});

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: Image.asset(
            image,
            height: screenSize.height * 0.16,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        PositionedDirectional(
          start: 16,
          height: screenSize.height * 0.16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                subTitle,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 70.0,
            height: 3.0,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: theme.hintColor.withOpacity(0.3),
            ),
          ),
        )
      ],
    );
  }
}
