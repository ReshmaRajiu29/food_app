import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class CartTile extends StatelessWidget {
  final CartItem item;

  const CartTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CartProvider>();

    return ListTile(
      title: Text(item.food.name),
      subtitle: Text("₹${item.total}"),
      leading: IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () => provider.decreaseQty(item),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => provider.decreaseQty(item),
      ),
    );
  }
}
