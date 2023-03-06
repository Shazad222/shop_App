import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/Order_item.dart';
import '../providers/order.dart' show Orders;
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const routName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            OrderItem(order: orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
