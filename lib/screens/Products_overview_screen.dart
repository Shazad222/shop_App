import 'package:f5/providers/product.dart';
import 'package:f5/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';

enum FilterOption { Favourites, All }

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("shoop App"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              if (selectedValue == FilterOption.Favourites) {
                productsContainer.showFavoritesOnly();
              } else {
                productsContainer.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("only Favourty"),
                value: FilterOption.Favourites,
              ),
              PopupMenuItem(
                child: Text("show all"),
                value: FilterOption.All,
              )
            ],
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
