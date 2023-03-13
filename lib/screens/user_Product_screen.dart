import 'package:f5/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../widgets/user_product.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});
  static const routeName = '/user-product';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("your Product"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, index) => userProductItem(
              id: productData.items[index].id,
              title: productData.items[index].title,
              imageUrl: productData.items[index].imageUrl,
            )
            // {
            //   final product = productData.items[index];
            //   return ListTile(
            //     leading: Image.network(product.imageUrl),
            //     title: Text(product.title),
            //     onTap: () {
            //       // Handle the tap event for the product item
            //     },
            //   );
            // },
            ,
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
