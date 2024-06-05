import 'package:deligo/components/custom_button.dart';
import 'package:deligo/components/custom_text_field.dart';
import 'package:deligo/generated/l10n.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  SupportPage({super.key});

  final List<(String, String)> faqs = [
    (
      "How to use Lorem ipsum?",
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
      "How to start a Lorem ipsum dolor?",
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
      "How to add Lorem ipsum?",
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
      "How to Lorem ipsum dolor?",
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
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            locale.getSupport,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            locale.askUsOrSuggest,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.hintColor,
            ),
          ),
          const SizedBox(height: 20),
          const CustomTextField(
            hintText: "Select Topic / issue type",
            suffixIcon: Icon(Icons.arrow_drop_down, size: 32),
          ),
          const SizedBox(height: 20),
          const CustomTextField(
            title: "Enter your message",
            hintText: "Write something...",
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          CustomButton(text: locale.submitMessage),
          const SizedBox(height: 28),
          Text(
            "FAQs",
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            locale.yourQuestionGotAnswered,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.hintColor,
            ),
          ),
          const SizedBox(height: 28),
          ListView.separated(
            itemBuilder: (context, index) {
              var faq = faqs[index];
              return ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: theme.hintColor, width: 0.5),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: theme.hintColor, width: 0.5),
                ),
                childrenPadding: const EdgeInsets.all(16),
                title: Text(faq.$1),
                children: [Text(faq.$2)],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: faqs.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
