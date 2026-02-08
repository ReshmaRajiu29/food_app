import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/providers/cart_provider.dart';
import 'package:food_app/widgets/cart_title.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Consumer<CartProvider>(
        builder: (context, cart, _) => Column(
          children: [
            Expanded(
              child: ListView(
                children: cart.items.map((e) => CartTile(item: e)).toList(),
              ),
            ),
            Text("Total: ₹${cart.totalPrice}"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/checkout");
              },
              child: const Text("Place Order"),
            )
          ],
        ),
      ),
    );
  }
}
