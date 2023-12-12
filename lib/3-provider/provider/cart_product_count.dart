import 'package:apple_store/3-provider/provider/product_in_cart.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class CartProductCountState {
  final int count;

  CartProductCountState({required this.count});

  factory CartProductCountState.initial() => CartProductCountState(count: 0);

  CartProductCountState copyWith({int? count}) =>
      CartProductCountState(count: count ?? this.count);
}

class CartProductCount extends StateNotifier<CartProductCountState>
    with LocatorMixin {
  
  CartProductCount() : super(CartProductCountState.initial());

  @override
  void update(Locator watch) {
    final newCartCount = watch<CartListState>().cartList.length;
    state = state.copyWith(count: newCartCount);
    super.update(watch);
  }
}
