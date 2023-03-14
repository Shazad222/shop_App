import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/Order_item.dart';
import '../providers/order.dart' show Orders;
import '../widgets/app_drawer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  static const routName = '/orders';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) =>
                  OrderItem(order: orderData.orders[index]),
              itemCount: orderData.orders.length,
            ),
    );
  }
}
