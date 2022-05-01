import 'package:flutter/material.dart';

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final DateTime dateTime;
  List<CartItem> products;
  OrderItem({
    required this.amount,
    required this.dateTime,
    required this.id,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _list = [];

  void addNewOrder(double total, List<CartItem> products) {
    if (products.isNotEmpty) {
      _list.insert(
        0,
        OrderItem(
          amount: total,
          products: products,
          dateTime: DateTime.now(),
          id: DateTime.now().toString(),
        ),
      );
    }
    notifyListeners();
  }

  List<OrderItem> get orders {
    return [..._list];
  }
}
