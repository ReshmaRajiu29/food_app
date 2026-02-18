import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CheckoutPage({super.key, required this.cartItems});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double get totalBill {
    double total = 0.0;
    for (var item in widget.cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  void _placeOrder() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Order Placed 🎉"),
        content: Text(
          "Your order has been placed successfully!\n\n"
          "Total Bill: ₹${totalBill.toStringAsFixed(2)}",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              setState(() {
                widget.cartItems.clear(); // Clear cart
              });
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: widget.cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return ListTile(
                        title: Text(item['name']),
                        subtitle: Text(
                          "₹${item['price']} x ${item['quantity']}",
                        ),
                        trailing: Text(
                          "₹${(item['price'] * item['quantity']).toStringAsFixed(2)}",
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹${totalBill.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _placeOrder,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            "Checkout",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
