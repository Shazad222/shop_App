// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductScreenDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  const ProductScreenDetailScreen(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Image.asset(imageUrl),
          Center(
            child: Text("product Detail PAge"),
          ),
        ],
      ),
    );
  }
}
