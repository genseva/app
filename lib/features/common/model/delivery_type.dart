import 'package:deligo/generated/assets.dart';

enum DeliveryType {
  delivery(Assets.headerHeaderPackage, "Where to Deliver?"),
  bike(Assets.headerHeaderRide,"Where to go?"),
  cab(Assets.headerHeaderCab, "Where to go?"),;

  final String image;
  final String title;

  const DeliveryType(this.image, this.title);
}
