import 'package:apple_store/3-provider/cart.dart';
import 'package:apple_store/3-provider/provider/providers.dart';
import 'package:apple_store/3-provider/store.dart';
import 'package:apple_store/common/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 현재 선택된 index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<CartList, CartListState>(
          create: (context) => CartList(),
        ),
        StateNotifierProvider<CartProductCount, CartProductCountState>(
          create: (context) => CartProductCount(),
        ),
      ],
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
        bottomNavigationBar: Builder(builder: (context) {
          return BottomBar(
            currentIndex: currentIndex,
            cartTotal: context.watch<CartProductCountState>().count,
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
          );
        }),
      ),
    );
  }
}
