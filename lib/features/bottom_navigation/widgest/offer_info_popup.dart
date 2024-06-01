import 'package:deligo/components/custom_button.dart';
import 'package:flutter/material.dart';

class OfferInfoPopUp extends StatelessWidget {
  OfferInfoPopUp({super.key, required this.banner});

  String banner;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(27)),
              child: Image.asset(
                banner,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "10% Cash Back",
                style: theme.textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Get 10% cashback on every purchase, up to 100% on your next purchase. Use code: 10CASHBACK and apply at checkout. T&C Apply. ",
                style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RichText(
                text: TextSpan(
                  text: '•  ',
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.primaryColor, fontSize: 18, fontWeight: FontWeight.w900),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'T&C Apply. ',
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              textColor: theme.primaryColor,
              text: "CASHBK10",
              buttonColor: theme.indicatorColor,
              borderColor: theme.primaryColor,
            )
          ],
        ),
      ],
    );
  }
}
