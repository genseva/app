import 'package:deligo/components/custom_button.dart';
import 'package:deligo/features/bottom_navigation/offers/model/offer_domain.dart';
import 'package:flutter/material.dart';

class OfferInfoPopUp extends StatelessWidget {
  const OfferInfoPopUp({super.key, required this.offer});

  final OfferDomain offer;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView(
      shrinkWrap: true,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(27)),
          child: Hero(
            tag: offer.offerCode,
            child: Image.asset(
              offer.bannerUrl,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            offer.offer,
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            offer.description,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
          ),
        ),
        const SizedBox(height: 20),
        ...offer.points.map((point) => _bulletPoint(theme, point)),
        const SizedBox(height: 12),
        CustomButton(
          margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          textColor: theme.primaryColor,
          text: offer.offerCode,
          buttonColor: theme.indicatorColor,
          borderColor: theme.primaryColor,
        ),
      ],
    );
  }

  Widget _bulletPoint(ThemeData theme, String point) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RichText(
        text: TextSpan(
          text: '•',
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.primaryColor, fontSize: 18, fontWeight: FontWeight.w900),
          children: [
            const WidgetSpan(child: SizedBox(width: 16)),
            TextSpan(
              text: point,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
            ),
          ],
        ),
      ),
    );
  }
}
