import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../cartmodels/cart_models.dart';

const cartDbName = 'TransactionDB';

abstract class cartDbFunctions {
  Future<List<CartModels>> getCart();
  Future<void> insertCart(CartModels models);
  Future<void> deleteCart(String cartId);
  Future<void> editCart(CartModels value, String cartId);
}

class CartDb implements cartDbFunctions {
  ValueNotifier<List<CartModels>> cartListNotifier = ValueNotifier([]);

    CartDb._internal();
  static final CartDb singleton = CartDb._internal();

  factory CartDb() {
    return singleton;
  }

  @override
  Future<void> deleteCart(String cartId) async {
    final cartDB = await Hive.openBox<CartModels>(cartDbName);
    await cartDB.delete(cartId);

    refresh();
  }

  Future<void> refresh() async {
    final allCart = await getCart();

    cartListNotifier.value.clear();
    await Future.forEach(allCart, (CartModels cart) {
      cartListNotifier.value.add(cart);
    });
    cartListNotifier.notifyListeners();
  }

  @override
  Future<void> editCart(CartModels value, String cartId) async {
    final cartDB = await Hive.openBox<CartModels>(cartDbName);
    await cartDB.put(cartId, value);
    refresh();
  }

  @override
  Future<List<CartModels>> getCart() async {
    final cartDB = await Hive.openBox<CartModels>(cartDbName);
    return cartDB.values.toList();
  }

  @override
  Future<void> insertCart(CartModels models) async {
    final cartDB = await Hive.openBox<CartModels>(cartDbName);
    await cartDB.put(models.id, models);
    refresh();
  }
}
