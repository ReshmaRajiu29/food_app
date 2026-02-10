import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Confirm Order"),
          onPressed: () {
            cart.clearOrder();
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }
}
