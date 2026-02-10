import 'package:flutter/material.dart';
import '../models/food.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class FoodTitle extends StatelessWidget {
  final Food food;

  const FoodTitle({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(food.name),
      subtitle: Text("₹ ${food.price}"),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          context.read<CartProvider>().addToCart(food);
        },
      ),
    );
  }
}
