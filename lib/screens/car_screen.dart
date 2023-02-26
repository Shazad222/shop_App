import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Consumer<Cart>(
                  //   builder: (context, value, child) => Chip(
                  //     label: Text(
                  //       '\$${value.totalAmount}',
                  //       style: TextStyle(fontSize: 23),
                  //     ),
                  //     backgroundColor: Theme.of(context).primaryColor,
                  //   ),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(fontSize: 23),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ci.CartItem(
                id: cart.items.values.toList()[index].id,
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quantity,
                title: cart.items.values.toList()[index].title),
          ))
        ],
      ),
    );
  }
}
