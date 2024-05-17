import 'package:bloc/bloc.dart';
import 'package:deligo/features/screens/cart/model/food_domain.dart';

class CartCubit extends Cubit<List<FoodDomain>> {
  CartCubit() : super([]);

  void updateFood(FoodDomain foodDomain) {
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

  void removeFood(FoodDomain foodDomain) {
    emit(state.where((element) => element.name != foodDomain.name).toList());
  }

  void clearCart() {
    emit([]);
  }

  void updateCart(List<FoodDomain> foodDomainList) {
    emit(foodDomainList);
  }

  void _updateFood(FoodDomain foodDomain) {
    emit(state.map((e) => e.name == foodDomain.name ? foodDomain : e).toList());
  }
}
