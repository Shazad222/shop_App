import 'package:f5/screens/Order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Hello friend"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
            leading: Icon(Icons.shop),
            title: Text("Shop"),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routName);
            },
            leading: Icon(Icons.abc_sharp),
            title: Text("order"),
          ),
        ],
      ),
    );
  }
}
