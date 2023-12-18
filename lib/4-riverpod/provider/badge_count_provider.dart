import 'package:apple_store/4-riverpod/provider/cart_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final badgeCountProvider = NotifierProvider<BadgeCount, int>(BadgeCount.new);

class BadgeCount extends Notifier<int> {
  @override
  int build() {
    final currentCnt = ref.watch(cartListProvider).cartList.length;
    return currentCnt;
  }
}
