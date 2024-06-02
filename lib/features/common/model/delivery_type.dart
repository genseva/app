import 'package:deligo/features/common/model/ride_domain.dart';
import 'package:deligo/generated/assets.dart';

enum DeliveryType {
  delivery(Assets.headerHeaderPackage, "Where to Deliver?", [
    RideDomain(Assets.rideInstDelivry, "InstaDelivery", "1-2 hrs", "Max 3-5 kgs", "8.00"),
    RideDomain(Assets.rideSameDayDelivery, "SameDayDelivery", "6-8 hrs", "Max 15-20 kgs", "10.00"),
  ]),
  bike(Assets.headerHeaderRide, "Where to go?", [
    RideDomain(Assets.rideInstaRide, "InstaRide", "5-6 mins", "1", "8.00"),
    RideDomain(Assets.rideElectRide, "ElectricRide", "8-10 mins", "1", "6.00"),
  ]),
  cab(Assets.headerHeaderCab, "Where to go?", [
    RideDomain(Assets.rideInstaQuid, "InstaQuid", "5-6 mins", "3", "12.00"),
    RideDomain(Assets.rideInstaMini, "InstaMini", "8-10 mins", "4", "16.00"),
    RideDomain(Assets.rideInstaMega, "InstaMega", "12-15 mins", "6", "19.00"),
    RideDomain(Assets.rideInstaRide, "InstaRide", "5-6 mins", "1", "8.00"),
    RideDomain(Assets.rideElectRide, "ElectricRide", "8-10 mins", "1", "6.00"),
  ]),
  ;

  final String image;
  final String title;
  final List<RideDomain> rideList;

  const DeliveryType(this.image, this.title, this.rideList);
}
