import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/food.dart';

class CartProvider extends ChangeNotifier {
  String tableNumber = "";

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get total =>
      _items.fold(0, (sum, item) => sum + item.food.price * item.qty);

  // ---------- TABLE ----------
  void setTable(String number) {
    tableNumber = number;
    notifyListeners();
  }

  // ---------- CART ----------
  void addItem(Food food) {
    final index = _items.indexWhere((e) => e.food.name == food.name);

    if (index >= 0) {
      _items[index].qty++;
    } else {
      _items.add(CartItem(food: food));
    }

    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // ---------- EXIT ----------
  void clearOrder() {
    tableNumber = "";
    _items.clear();
    notifyListeners();
  }

  void decreaseQty(CartItem item) {}

  void addToCart(Food food) {}
}
