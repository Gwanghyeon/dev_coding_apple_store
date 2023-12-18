import 'package:apple_store/4-riverpod/provider/cart_list_provider.dart';
import 'package:apple_store/common/product.dart';
import 'package:apple_store/common/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Store extends ConsumerWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(context, ref) {
    final cartList = ref.watch(cartListProvider).cartList;
    return Scaffold(
      body: ListView.builder(
        itemCount: storeProductList.length,
        itemBuilder: (context, index) {
          Product product = storeProductList[index];
          return ProductTile(
            product: product,
            isInCart: cartList.contains(product),
            onPressed: ref.read(cartListProvider.notifier).onCartPressed,
          );
        },
      ),
    );
  }
}
