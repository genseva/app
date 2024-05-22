import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:deligo/features/cart/model/coupon_domain.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';

class CartCubit extends Cubit<List<ProductDomain>> {
  CartCubit() : super([]);

  StoreDomain? store;
  final double deliveryCharges = 2.50;
  final double taxes = 1.50;
  CouponDomain? coupon;

  void updateFood(ProductDomain foodDomain) {
    if (state.any((element) => element.name == foodDomain.name)) {
      if (foodDomain.quantity > 0) {
        _updateFood(foodDomain);
      } else {
        removeFood(foodDomain);
      }
    } else {
      emit([...state, foodDomain]);
    }
  }

  void removeFood(ProductDomain foodDomain) {
    emit(state.where((element) => element.name != foodDomain.name).toList());
  }

  void clearCart() {
    store = null;
    emit([]);
  }

  void updateCart(List<ProductDomain> foodDomainList) {
    emit(foodDomainList);
  }

  void _updateFood(ProductDomain foodDomain) {
    emit(state.map((e) => e.name == foodDomain.name ? foodDomain : e).toList());
  }

  double getCartTotal() {
    double total = 0;
    for (var element in state) {
      total += element.price * element.quantity;
    }
    return total;
  }

  double getCartTotalWithCharges() {
    var total = getCartTotal() + deliveryCharges + taxes;
    double discount = 0;
    if (coupon != null) {
      discount = min(coupon!.discountPercentage * total / 100, coupon!.maxDiscount);
    }
    return total - discount;
  }

  void updateCoupon(CouponDomain couponDomain) {
    coupon = couponDomain;
    _refresh();
  }

  void removeCoupon() {
    coupon = null;
    _refresh();
  }

  void _refresh() {
    List<ProductDomain> products = state;
    emit([]);
    emit(products);
  }

  double getDiscount() {
    return min(coupon!.discountPercentage * getCartTotalWithCharges() / 100, coupon!.maxDiscount);
  }
}
