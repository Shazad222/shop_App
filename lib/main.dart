import 'package:f5/screens/Products_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/product_provider.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Color.fromARGB(255, 210, 58, 58),
          // fontFamily: 'Lato',
          primarySwatch: Colors.green,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductScreenDetailScreen.routName: (ctx) =>
              ProductScreenDetailScreen(),
        },
      ),
    );
  }
}
