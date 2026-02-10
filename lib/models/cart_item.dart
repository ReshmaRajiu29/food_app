import 'food.dart';

class CartItem {
  final Food food;
  int qty;

  CartItem({required this.food, this.qty = 1});
}
