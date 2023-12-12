import 'package:apple_store/3-provider/state/provider_cart.dart';
import 'package:apple_store/common/product.dart';
import 'package:apple_store/common/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsInCart = context.select<CartProvider, List<Product>>(
        (cartProvider) => cartProvider.productsInCart);
    return Scaffold(
      body: productsInCart.isEmpty

          /// Empty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )

          /// Not Empty
          : ListView.builder(
              itemCount:productsInCart.length,
              itemBuilder: (context, index) {
                Product product =productsInCart[index];
                return ProductTile(
                  product: product,
                  isInCart: true,
                  onPressed: context.read<CartProvider>().addOrRemoveProducts,
                );
              },
            ),
    );
  }
}
