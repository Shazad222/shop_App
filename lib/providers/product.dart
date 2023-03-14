// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  void _setFarValue(bool newValue){
    isFavorite = newValue;
    notifyListeners();
  }
  Future<void> toggleFavouritesState() async {
    isFavorite = !isFavorite;
    final oldStatus = isFavorite;
    notifyListeners();
    final url =
        "https://flutter-update2-808f2-default-rtdb.firebaseio.com/Products/$id.json";
    try {
      final response = await http.patch(Uri.parse(url),
          body: json.encode({
            'isFavorite': isFavorite,
          }));
      if (response.statusCode >= 400) {
       _setFarValue(oldStatus);
      }
    } catch (error) {
      _setFarValue(oldStatus);
      print("object");
    }
  }
}
