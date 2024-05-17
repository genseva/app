import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInfoWidget extends StatelessWidget {
  CustomInfoWidget(this.icon, this.title, this.subTitle, {super.key});

  String title;
  String subTitle;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Colors.grey),
        ),
        Row(
          children: [
            Icon(
              icon,
              color: Colors.green.shade700,
              size: 15,
            ),
            const SizedBox(width: 5),
            if (subTitle.contains(r"$$"))
              RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                    const TextSpan(
                      text: r"$$",
                    ),
                    TextSpan(
                        text: r"$$",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.grey)),
                  ]))
            else
              Text(
                subTitle,
                style: Theme.of(context).textTheme.titleMedium,
              )
          ],
        )
      ],
    );
  }
}
