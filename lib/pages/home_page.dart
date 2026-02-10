import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/food_data.dart';
import '../providers/cart_provider.dart';
import '../widgets/food_title.dart';
import '../widgets/exit_wrapper.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ExitWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<CartProvider>(
            builder: (_, cart, __) => Text("Table ${cart.tableNumber} | Menu"),
          ),
        ),
        body: ListView(
          children: foods.map((f) => FoodTitle(food: f)).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartPage()),
          ),
        ),
      ),
    );
  }
}
