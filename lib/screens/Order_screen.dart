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
  late Future _orderFuture;
  Future _obtainOrderFuture() async {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _orderFuture = _obtainOrderFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return const Center(
                child: Text("hellow"),
              );
            } else {
              return Consumer<Orders>(
                builder: (context, orderData, child) => ListView.builder(
                  itemBuilder: (context, index) =>
                      OrderItem(order: orderData.orders[index]),
                  itemCount: orderData.orders.length,
                ),
              );
            }
          }
        },
        future: _orderFuture,
      ),
    );
  }
}
