// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });
  final String id;
  final double price;
  final int quantity;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(child: Text('\$${price}')),
            ),
          ),
          subtitle: Text('Total : \$${price * quantity}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
