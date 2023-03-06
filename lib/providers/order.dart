// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:f5/providers/cart.dart';
import 'package:flutter/material.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;
  OrderItem({
    required this.id,
    required this.amount,
    required this.product,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _order = [];

  List<OrderItem> get orders {
    return [..._order];
  }

  void addOrder(List<CartItem> cartProduct, double total) {
    _order.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        product: cartProduct,
        dateTime: DateTime.now(),
      ),
    );
  }

  @override
  void notifyListeners();
}
