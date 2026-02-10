import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../pages/table_page.dart';

class ExitWrapper extends StatelessWidget {
  final Widget child;

  const ExitWrapper({super.key, required this.child});

  Future<bool> confirmExit(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Exit Order?"),
            content: const Text("All cart data will be cleared."),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("Cancel")),
              TextButton(
                onPressed: () {
                  context.read<CartProvider>().clearOrder();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const TablePage()),
                    (route) => false,
                  );
                },
                child: const Text("Exit"),
              )
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => confirmExit(context),
      child: child,
    );
  }
}
