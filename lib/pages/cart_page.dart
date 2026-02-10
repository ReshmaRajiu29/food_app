import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text("Cart | Table ${context.read<CartProvider>().tableNumber}")),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) => cart.items.isEmpty
            ? const Center(child: Text("Cart is empty"))
            : ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return ListTile(
                    title: Text(item.food.name),
                    subtitle: Text(
                        "Qty: ${item.qty}  |  ₹${item.food.price * item.qty}"),
                    leading: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () => cart.decreaseQty(item),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => cart.increaseQty(item),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cart, _) => Padding(
          padding: const EdgeInsets.all(12),
          child: ElevatedButton(
            onPressed: cart.items.isEmpty
                ? null
                : () => Navigator.pushNamed(context, '/checkout'),
            child: Text("Checkout | ₹${cart.total}"),
          ),
        ),
      ),
    );
  }
}
