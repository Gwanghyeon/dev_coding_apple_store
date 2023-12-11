import 'package:apple_store/1-stateful_widget/cart.dart';
import 'package:apple_store/1-stateful_widget/store.dart';
import 'package:apple_store/common/bottom_bar.dart';
import 'package:apple_store/common/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 현재 선택된 index
  int currentIndex = 0;

  // 카트에 추가된 상품 목록
  List<Product> productsInCart = List.empty(growable: true);

  /// 카트 추가/삭제 함수
  void addProduct(Product product) {
    if (productsInCart.contains(product)) {
      // 카트에 이미 추가된 경우 삭제
      productsInCart.remove(product);
    } else {
      // 카트에 없는 경우 추가
      productsInCart.add(product);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack vs TabBarView
      // IndexedStack: 모든 페이지를 시작시에 렌더링
      body: IndexedStack(
        index: currentIndex,
        children: [
          /// Store
          Store(
            productsInCart: productsInCart,
            onPressed: addProduct,
          ),

          /// Cart
          Cart(
            productsinCart: productsInCart,
            onPressed: addProduct,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        cartTotal: '${productsInCart.length}',
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
