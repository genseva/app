import 'package:bloc/bloc.dart';
import 'package:deligo/features/cart/model/product_domain.dart';

class CartCubit extends Cubit<List<ProductDomain>> {
  CartCubit() : super([]);

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
    emit([]);
  }

  void updateCart(List<ProductDomain> foodDomainList) {
    emit(foodDomainList);
  }

  void _updateFood(ProductDomain foodDomain) {
    emit(state.map((e) => e.name == foodDomain.name ? foodDomain : e).toList());
  }
}
