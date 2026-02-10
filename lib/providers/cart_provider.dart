import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/food.dart';

class CartProvider extends ChangeNotifier {
  String tableNumber = "";

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get total =>
      _items.fold(0, (sum, item) => sum + item.food.price * item.qty);

  void setTable(String number) {
    tableNumber = number;
    notifyListeners();
  }

  void addItem(Food food) {
    final index = _items.indexWhere((e) => e.food.name == food.name);

    if (index >= 0) {
      _items[index].qty++;
    } else {
      _items.add(CartItem(food: food));
    }
    notifyListeners();
  }

  void increaseQty(CartItem item) {
    item.qty++;
    notifyListeners();
  }

  void decreaseQty(CartItem item) {
    if (item.qty > 1) {
      item.qty--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  void clearOrder() {
    tableNumber = "";
    _items.clear();
    notifyListeners();
  }
}
