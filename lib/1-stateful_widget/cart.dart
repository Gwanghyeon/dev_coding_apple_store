import 'package:apple_store/common/product.dart';
import 'package:apple_store/common/product_tile.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
    required this.productsinCart,
    required this.onPressed,
  });

  final List<Product> productsinCart;
  final void Function(Product product) onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productsinCart.isEmpty

          /// Empty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )

          /// Not Empty
          : ListView.builder(
              itemCount: productsinCart.length,
              itemBuilder: (context, index) {
                Product product = productsinCart[index];
                return ProductTile(
                  product: product,
                  isInCart: true,
                  onPressed: onPressed,
                );
              },
            ),
    );
  }
}
