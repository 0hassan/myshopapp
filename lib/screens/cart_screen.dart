// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:myshopapp/widgets/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:myshopapp/providers/cart.dart' show Cart;

import 'package:myshopapp/providers/order.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontFamily: 'Lato-Bold', fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text('\$${cart.totallBill.toStringAsFixed(2)}'),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  FlatButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addNewOrder(
                          cart.totallBill,
                          cart.list.values.toList(),
                        );
                        cart.clear();
                      },
                      child: const Text('ORDER NOW'))
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => CartItem(
                pid: cart.list.keys.toList()[index],
                id: cart.list.values.toList()[index].id,
                title: cart.list.values.toList()[index].title,
                price: cart.list.values.toList()[index].price,
                quantity: cart.list.values.toList()[index].quantity,
              ),
              itemCount: cart.itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
