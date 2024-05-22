class CouponDomain {
  final String id;
  final String description;
  final double discountPercentage;
  final double maxDiscount;

  CouponDomain(this.id, this.description, this.discountPercentage, this.maxDiscount);

 static final List<CouponDomain> list = [
   CouponDomain("OFF20", "Get 20% discount up to \$2", 20.00, 2.00)
 ] ;
}
