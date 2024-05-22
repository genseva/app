import 'package:bloc/bloc.dart';
import 'package:deligo/features/common/model/product_domain.dart';
import 'package:deligo/features/common/model/store_domain.dart';

class CartCubit extends Cubit<List<ProductDomain>> {
  CartCubit() : super([]);

  StoreDomain? store;
  final double deliveryCharges = 2.50;
  final double taxes = 1.50;

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
    return getCartTotal() + deliveryCharges + taxes;
  }
}
