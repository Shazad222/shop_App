import 'package:f5/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_grid.dart';
import 'car_screen.dart';

enum FilterOption { Favourites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isinit = true;
  var _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProduct();
      setState(() {
        _isLoading = false;
      });
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("shoop App"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favourites) {
                  // productsContainer.showFavoritesOnly();
                  _showOnlyFavorites = true;
                } else {
                  // productsContainer.showAll();
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FilterOption.Favourites,
                child: Text("only Favourty"),
              ),
              const PopupMenuItem(
                value: FilterOption.All,
                child: Text("show all"),
              )
            ],
          ),
          SizedBox(
            height: 12,
            child: Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                label: Text(cart.itemCount.toString()),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(_showOnlyFavorites),
    );
  }
}
