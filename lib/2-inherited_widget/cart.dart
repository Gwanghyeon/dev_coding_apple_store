import 'package:apple_store/2-inherited_widget/state/inherited_cart.dart';
import 'package:flutter/material.dart';

import '../common/product.dart';
import '../common/product_tile.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final inheritedCart = InheritedCart.of(context);
    final inheritedCart = context.read<InheritedCart>();
    final List<Product> cartProductList = inheritedCart.productsInCart;

    return Scaffold(
      body: cartProductList.isEmpty

          /// Empty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )

          /// Not Empty
          : ListView.builder(
              itemCount: cartProductList.length,
              itemBuilder: (context, index) {
                Product product = cartProductList[index];
                return ProductTile(
                  product: product,
                  isInCart: true,
                  onPressed: inheritedCart.onPressed,
                );
              },
            ),
    );
  }
}
