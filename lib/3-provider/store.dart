import 'package:apple_store/3-provider/state/provider_cart.dart';
import 'package:apple_store/common/product.dart';
import 'package:apple_store/common/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider=context.watch<CartProvider>();
    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: cartProvider.productsInCart.contains(product),
            onPressed: cartProvider.addOrRemoveProducts,
          );
        },
      ),
    );
  }
}