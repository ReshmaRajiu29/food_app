import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/food.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Food food) {
    final index = _items.indexWhere((e) => e.food.name == food.name);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(food: food));
    }

    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void increaseQty(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQty(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    }
    notifyListeners();
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.total);

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
