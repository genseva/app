import 'package:deligo/generated/assets.dart';

class TransactionDomain {
  final String icon;
  final String title;
  final String dateTime;
  final double amount;

  TransactionDomain(this.icon, this.title, this.dateTime, this.amount);

  static final List<TransactionDomain> list = [
    TransactionDomain(Assets.categoryCatgCab, "Cab", "20 Jun, 10:20 AM", 199.00),
    TransactionDomain(Assets.categoryCatgEcommerce, "Leather Jacket", "20 Jun, 10:20 AM", 13.00),
    TransactionDomain(Assets.categoryCatgFood, "Hotel China Town", "20 Jun, 10:20 AM", 17.00),
    TransactionDomain(Assets.paymentCreditCard, "Top Up - Credit Card", "20 Jun, 10:20 AM", 8.30),
    TransactionDomain(Assets.categoryCatgGrocery, "Megamart Shop", "20 Jun, 10:20 AM", 17.00),
    TransactionDomain(Assets.categoryCatgHanydman, "AC Service", "20 Jun, 10:20 AM", 19.00),
    TransactionDomain(Assets.categoryCatgMedicine, "Medicine", "20 Jun, 10:20 AM", 19.50),
    TransactionDomain(Assets.categoryCatgParcel, "Parcel", "20 Jun, 10:20 AM", 23.00),
    TransactionDomain(Assets.categoryCatgRide, "Ride", "20 Jun, 10:20 AM", 149.00),
  ];
  static final List<TransactionDomain> ongoingOrder = [
    TransactionDomain(Assets.categoryCatgFood, "Hotel China Town", "20 Jun, 10:20 AM", 17.00),
    TransactionDomain(Assets.categoryCatgGrocery, "Megamart Shop", "20 Jun, 10:20 AM", 17.00),
  ];

  static final List<TransactionDomain> topUps = [
    TransactionDomain(Assets.paymentCreditCard, "Top Up - Credit Card", "20 Jun, 10:20 AM", 8.30),
    TransactionDomain(Assets.paymentDebitCard, "Top Up - Debit Card", "20 Jun, 10:20 AM", 8.30),
    TransactionDomain(
        Assets.paymentOnlineBanking, "Top Up - Online Banking", "20 Jun, 10:20 AM", 8.30),
    TransactionDomain(Assets.paymentPayu, "Top Up - PayU", "20 Jun, 10:20 AM", 8.30),
    TransactionDomain(Assets.paymentPaypal, "Top Up - Paypal", "20 Jun, 10:20 AM", 8.30),
  ];
}
