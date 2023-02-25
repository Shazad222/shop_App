// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductScreenDetailScreen extends StatelessWidget {
  // final String title;
  // final String imageUrl;
  // const ProductScreenDetailScreen(this.title, this.imageUrl);
  static const routName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final LoadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(
      productId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(LoadedProduct.title),
      ),
      body: Column(
        children: [
          Image.asset(LoadedProduct.imageUrl),
          const Center(
            child: Text("product Detail PAge"),
          ),
        ],
      ),
    );
  }
}
