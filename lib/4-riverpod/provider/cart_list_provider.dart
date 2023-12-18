import 'package:apple_store/common/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartListProvider =
    NotifierProvider<CartList, CartListState>(CartList.new);

// State of CartList
class CartListState {
  final List<Product> cartList;

  CartListState({
    required this.cartList,
  });

  factory CartListState.init() =>
      CartListState(cartList: List.empty(growable: true));

  CartListState copyWith({
    List<Product>? cartList,
  }) {
    return CartListState(
      cartList: cartList ?? this.cartList,
    );
  }
}

class CartList extends Notifier<CartListState> {
  @override
  build() => CartListState.init();

  // function of adding or removing a product from the list
  void onCartPressed(Product product) {
    if (state.cartList.contains(product)) {
      // 이미 추가되어 있는 경우에는 삭제
      final newList = state.cartList.where((item) => product != item).toList();
      state = state.copyWith(cartList: newList);
    } else {
      // 리스트에 없는 경우에는 추가
      final newList = [...state.cartList, product];
      state = state.copyWith(cartList: newList);
    }
  }
}
