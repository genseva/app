import 'package:deligo/app_config/colors.dart';
import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.only(start: 4, top: 3, bottom: 3, end: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ratingCardColor,
      ),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 12,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '4.2',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 10, color: Theme.of(context).scaffoldBackgroundColor),
          )
        ],
      ),
    );
  }
}
