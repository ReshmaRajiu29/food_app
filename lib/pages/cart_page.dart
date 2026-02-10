import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Table ${cart.tableNumber} | Cart")),
      body: ListView(
        children: cart.items
            .map((e) => ListTile(
                  title: Text(e.food.name),
                  subtitle: Text("Qty: ${e.qty}"),
                  trailing: Text("₹${e.food.price * e.qty}"),
                ))
            .toList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          child: Text("Checkout ₹${cart.total}"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CheckoutPage()),
          ),
        ),
      ),
    );
  }
}
