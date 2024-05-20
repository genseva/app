import 'package:flutter/material.dart';

class TncPage extends StatelessWidget {
  TncPage({super.key});

  final List<(String, String)> list = [
    (
      "Company's Terms of use",
      'Lorem ipsum dolor sit amet, consectetur'
          'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna '
          'aliqua. Odio facilisis mauris sit amet massa. Tellus pellentesque eu '
          'tincidunt tortor aliquam nulla facilisi cras fermentum. Sit amet risus nullam '
          'eget felis eget nunc. Placerat in egestas erat imperdiet sed. Vestibulum '
          'mattis ullamcorper velit sed. At auctor urna nunc id cursus metus aliquam. In '
          'nibh mauris cursus mattis. Quis blandit turpis cursus in hac habitasse platea '
          'dictumst. Orci a scelerisque purus semper eget duis at tellus. At tempor'
    ),
    (
      "Terms & Conditions",
      'Lorem ipsum dolor sit amet, consectetur'
          'adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna '
          'aliqua. Odio facilisis mauris sit amet massa. Tellus pellentesque eu '
          'tincidunt tortor aliquam nulla facilisi cras fermentum. Sit amet risus nullam '
          'eget felis eget nunc. Placerat in egestas erat imperdiet sed. Vestibulum '
          'mattis ullamcorper velit sed. At auctor urna nunc id cursus metus aliquam. In '
          'nibh mauris cursus mattis. Quis blandit turpis cursus in hac habitasse platea '
          'dictumst. Orci a scelerisque purus semper eget duis at tellus. At tempor'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            "Terms & Conditions",
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListView.separated(
            itemBuilder: (context, index) {
              var e = list[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    e.$1,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    e.$2,
                    style: theme.textTheme.titleSmall?.copyWith(letterSpacing: 0.8, fontSize: 15),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemCount: list.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
