import 'package:deligo/app_config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBarIndicator extends StatelessWidget {
  const CustomRatingBarIndicator(this.rating, {super.key});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      unratedColor: greyTextColor.withOpacity(0.3),
      itemCount: 5,
      itemSize: 30.0,
      direction: Axis.horizontal,
    );
  }
}
