import 'package:apple_store/common/product.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class CartListState {
  final List<Product> cartList;

  CartListState({required this.cartList});

  factory CartListState.initial() =>
      CartListState(cartList: List<Product>.empty(growable: true));

  CartListState copyWith({List<Product>? cartList}) =>
      CartListState(cartList: cartList ?? this.cartList);
}

class CartList extends StateNotifier<CartListState> {
  CartList() : super(CartListState.initial());

  void addOrRemoveProduct(Product product) {
    final currentList = state.cartList;
    if (currentList.contains(product)) {
      // Remove the item from the list
      final newList = currentList
          .where((currentProduct) => currentProduct != product)
          .toList();
      state = state.copyWith(cartList: newList);
    } else {
      // Adding new Item to the list
      final newList = [...currentList, product];
      state = state.copyWith(cartList: newList);
    }
  }
}
