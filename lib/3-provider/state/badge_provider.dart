// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:apple_store/3-provider/state/provider_cart.dart';
import 'package:flutter/material.dart';

class BadgeProvider with ChangeNotifier {
  int counter;
  final CartProvider cartProvider;

  BadgeProvider({this.counter = 0, required this.cartProvider}) {
    cartProvider.addListener(cartProviderListener);
  }

  @override
  void dispose() {
    cartProvider.removeListener(cartProviderListener);
    super.dispose();
  }

  // Listener
  void cartProviderListener() {
    counter = cartProvider.productsInCart.length;
  }

  BadgeProvider copyWith({
    int? counter,
    CartProvider? cartProvider,
  }) {
    return BadgeProvider(
      counter: counter ?? this.counter,
      cartProvider: cartProvider ?? this.cartProvider,
    );
  }
}
