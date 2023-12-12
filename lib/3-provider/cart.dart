import 'package:apple_store/3-provider/provider/product_in_cart.dart';
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
    final cartList = context.watch<CartListState>().cartList;
    return Scaffold(
      body: cartList.isEmpty

          /// Empty
          ? const Center(
              child: Text(
                "Empty",
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
            )

          /// Not Empty
          : ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                Product product = cartList[index];
                return ProductTile(
                  product: product,
                  isInCart: true,
                  onPressed: context.read<CartList>().addOrRemoveProduct,
                );
              },
            ),
    );
  }
}
