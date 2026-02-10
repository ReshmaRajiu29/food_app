import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../providers/cart_provider.dart';

class FoodTitle extends StatelessWidget {
  final Food food;
  const FoodTitle({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: Image.asset(food.image, width: 60, height: 60),
        title: Text(food.name),
        subtitle: Text("₹${food.price}"),
        trailing: IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.green),
          onPressed: () {
            context.read<CartProvider>().addItem(food);
          },
        ),
      ),
    );
  }
}
