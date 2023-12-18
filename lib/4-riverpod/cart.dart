import 'package:apple_store/4-riverpod/provider/cart_list_provider.dart';
import 'package:apple_store/common/product.dart';
import 'package:apple_store/common/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cart extends ConsumerWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final cartList = ref.watch(cartListProvider).cartList;
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
                  onPressed: ref.read(cartListProvider.notifier).onCartPressed,
                );
              },
            ),
    );
  }
}
