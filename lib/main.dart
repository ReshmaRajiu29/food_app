import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

import 'pages/table_page.dart';
import 'pages/cart_page.dart';
import 'pages/checkout_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ✅ Start from table page
      home: const TablePage(),

      // only keep other routes
      routes: {
        '/cart': (_) => const CartPage(),
        '/checkout': (_) => const CheckoutPage(),
      },
    );
  }
}
