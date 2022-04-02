import 'package:flutter/material.dart';

class CartItem {
  final String id, title;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });
}

class Cart with ChangeNotifier {
  // ignore: prefer_final_fields
  Map<String, CartItem> _list = {};

  Map<String, CartItem> get list {
    return {..._list};
  }

  int get itemCount {
    return _list.length;
  }

  double get totallBill {
    double temp = 0;
    _list.forEach((key, value) {
      temp = temp + (value.price * value.quantity);
    });
    return temp.roundToDouble();
  }

  void addToCart(
    String pId,
    String title,
    double price,
  ) {
    if (_list.containsKey(pId)) {
      _list.update(
        pId,
        (value) => CartItem(
          id: value.id,
          price: value.price,
          quantity: value.quantity + 1,
          title: value.title,
        ),
      );
    } else {
      _list.putIfAbsent(
        pId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title,
        ),
      );
    }
    notifyListeners();
  }

  void removeItemFromCart(String id) {
    _list.remove(id);
    notifyListeners();
  }

  void clear() {
    _list.clear();
    notifyListeners();
  }
}
