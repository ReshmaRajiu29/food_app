import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: const Text("Receipt")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "RESTAURANT BILL",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text("Table: ${cart.tableNumber}"),
            Text("Date: ${now.day}/${now.month}/${now.year}"),
            Text("Time: ${now.hour}:${now.minute}"),

            const Divider(height: 30),

            /// Items
            Expanded(
              child: ListView(
                children: cart.items.map((item) {
                  final subtotal = item.food.price * item.quantity;

                  return ListTile(
                    title: Text(item.food.name),
                    subtitle: Text("₹${item.food.price} × ${item.quantity}"),
                    trailing: Text("₹$subtotal"),
                  );
                }).toList(),
              ),
            ),

            const Divider(),

            /// Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "TOTAL",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹${cart.total}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// Done button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Done"),
                onPressed: () {
                  context.read<CartProvider>().clearOrder();

                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
