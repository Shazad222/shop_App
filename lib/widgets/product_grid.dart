// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/product_provider.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;
  const ProductGrid(
    this.showFavs,
  );

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products =showFavs? productData.faviruteItems: productData.items;
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: ((context, index) => ChangeNotifierProvider.value(
            // create:(c)=> products[index],
            value: products[index],
            child: ProductItem(),
            // id: products[index].id,
            // title: products[index].title,
            // imageUrl: products[index].imageUrl,
          )),
    );
  }
}
