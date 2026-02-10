import 'package:flutter/material.dart';
import '../data/food_data.dart' as food_data show foods;

import '../widgets/food_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String tableNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
      body: ListView(
        children: food_data.foods.map((f) => FoodTile(food: f)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
      ),
    );
  }
}
