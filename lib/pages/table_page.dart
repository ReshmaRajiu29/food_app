import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'home_page.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final controller = TextEditingController();

  void start() {
    if (controller.text.isEmpty) return;

    context.read<CartProvider>().setTable(controller.text);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("🍽️ Smart Restaurant",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Table Number",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: start,
                child: const Text("Start Ordering"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
