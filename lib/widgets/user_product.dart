// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../screens/edit_product_screen.dart';

class userProductItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  const userProductItem({
    Key? key,
    required this.title,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {Navigator.of(context).pushNamed(EditProductScreen.routeName,arguments: id);},
              icon: Icon(Icons.edit),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
