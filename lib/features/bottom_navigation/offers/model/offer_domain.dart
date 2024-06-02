import 'package:deligo/generated/assets.dart';

class OfferDomain {
  final String bannerUrl;
  final String offer;
  final String offerCode;
  final String description;
  final List<String> points;

  OfferDomain(this.bannerUrl, this.offer, this.offerCode, this.description, this.points);

  static final List<OfferDomain> list = [
    OfferDomain(
      Assets.bannerFood1,
      "10% Cashback",
      "CASHBK10",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      ["Lorem ipsum", "consectetur adipiscing", "eiusmod tempor"],
    ),
    OfferDomain(
      Assets.bannerFood2,
      "Free Delivery",
      "FREEDEL",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      ["tempor incididunt", "dolor sit", "eiusmod tempor"],
    ),
    OfferDomain(
      Assets.bannerGrocery1,
      "Summer Discount",
      "SUMMEROFF",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      ["dolore magna", "sed do eiusmod", "eiusmod tempor"],
    ),
    OfferDomain(
      Assets.bannerGrocery2,
      "Beauty Sale",
      "BEAUTYSALE",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      ["ut labore et", "consectetur adipiscing", "dolore magna"],
    ),
  ];
}
