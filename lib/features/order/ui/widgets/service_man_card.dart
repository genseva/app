import 'package:deligo/components/rating_card.dart';
import 'package:flutter/material.dart';

class ServiceManCard extends StatelessWidget {
  ServiceManCard(this.name, this.image, this.title, {super.key});

  final String name;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16).copyWith(bottom: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.hintColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(child: Divider()),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    "George Anderson",
                    style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 20),
                  const RatingCard(rating: "4.5"),
                ],
              ),
            ],
          ),
          SizedBox(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  image,
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                PositionedDirectional(
                  bottom: -26,
                  start: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.scaffoldBackgroundColor,
                      border: Border.all(color: theme.hintColor),
                    ),
                    child: Icon(Icons.call, color: theme.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
