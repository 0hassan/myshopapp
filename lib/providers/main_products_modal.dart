import 'package:flutter/material.dart';

class MainProductModal with ChangeNotifier {
  final String id, title, description, imgUrl;
  final double price;
  late bool isFavorite;

  MainProductModal({
    required this.description,
    required this.id,
    required this.imgUrl,
    this.isFavorite = false,
    required this.price,
    required this.title,
  });

  void togleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
