import 'package:apple_store/2-inherited_widget/cart.dart';
import 'package:apple_store/2-inherited_widget/state/inherited_cart.dart';
import 'package:apple_store/2-inherited_widget/store.dart';
import 'package:apple_store/common/bottom_bar.dart';
import 'package:apple_store/common/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  List<Product> productsInCart = List.empty(growable: true);

  void onCartPressed(Product product) {
    // * 깊은 복사를 통해 서로 다른 참조를 가지도록 하여 update가 가능하도록 함
    if (productsInCart.contains(product)) {
      // productsInCart.remove(product);
      productsInCart =
          productsInCart.where((element) => element != product).toList();
    } else {
      // productsInCart.add(product);
      productsInCart = [...productsInCart, product];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCart(
      productsInCart: productsInCart,
      onPressed: onCartPressed,
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            /// Store
            Store(),

            /// Cart
            Cart(),
          ],
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: currentIndex,
          cartTotal: '${productsInCart.length}',
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
        ),
      ),
    );
  }
}
