import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>(); // 👈 watch instead of read

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Table: ${cart.tableNumber}"),
            const SizedBox(height: 20),
            Text(
              "Total: ₹${cart.total}",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              child: const Text("Confirm Order"),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Order Placed ✅"),
                    content: const Text("Your food is being prepared!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      )
                    ],
                  ),
                );

                cart.clearOrder();

                // ignore: use_build_context_synchronously
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
