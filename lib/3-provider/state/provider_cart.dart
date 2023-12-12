import 'package:apple_store/common/product.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  // State: products list which are in the list
  List<Product> productsInCart = List.empty(growable: true);

  /// Function
  /// Adding or Removing a product from the list
  void addOrRemoveProducts(Product product) {
    if (productsInCart.contains(product)) {
      // productsInCart.remove(product);
      productsInCart =
          productsInCart.where((element) => element != product).toList();
    } else {
      // productsInCart.add(product);
      productsInCart = [...productsInCart, product];
    }
    notifyListeners();
  }
}
