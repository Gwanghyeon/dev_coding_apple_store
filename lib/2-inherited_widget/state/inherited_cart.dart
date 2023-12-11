// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common/product.dart';

class InheritedCart extends InheritedWidget {
  final List<Product> productsInCart;
  final void Function(Product product) onPressed;

  const InheritedCart({
    super.key,
    required super.child,
    required this.productsInCart,
    required this.onPressed,
  });

  /// static으로 작성하여 복잡한 함수명을 간단히 하는 것이 가능
  static InheritedCart of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCart>()!;
  }

  @override
  bool updateShouldNotify(InheritedCart oldWidget) {
    // 리스트의 길이가 다른 경우에만 갱신을 실시
    return oldWidget.productsInCart != productsInCart;
  }
}

/// buildContext에 extention으로 read를 추가하여
/// dependOnInheritedWidgetOfExactType에 좀 더 쉽게 접근하도록 설정
extension ReadExt on BuildContext {
  T read<T extends InheritedWidget>() =>
      dependOnInheritedWidgetOfExactType<T>()!;
}
