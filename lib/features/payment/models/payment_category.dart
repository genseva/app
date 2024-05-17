import 'package:deligo/features/payment/models/payment_method.dart';
import 'package:deligo/generated/assets.dart';

class PaymentCategory {
  final String title;
  final List<PaymentMethod> paymentMethods;

  PaymentCategory(this.title, this.paymentMethods);

  static final List<PaymentCategory> list = [
    PaymentCategory(
      "Instant Pay",
      [
        PaymentMethod(Assets.paymentVecWallet, "GoWallet"),
      ],
    ),
    PaymentCategory(
      "Online Payments",
      [
        PaymentMethod(Assets.paymentPaypal, "PayPal"),
        PaymentMethod(Assets.paymentPayu, "PayUMoney"),
        PaymentMethod(Assets.paymentOnlineBanking, "Online Banking"),
      ],
    ),
    PaymentCategory(
      "Other",
      [
        PaymentMethod(Assets.paymentCreditCard, "Credit Card"),
        PaymentMethod(Assets.paymentDebitCard, "Debit Card"),
        PaymentMethod(Assets.paymentVecMoney, "Cash on Delivery"),
      ],
    ),
  ];
}
