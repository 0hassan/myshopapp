import 'package:flutter/material.dart';
import 'package:myshopapp/providers/order.dart' as pdr;
import 'package:provider/provider.dart';

import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<pdr.Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Orders',
          style: TextStyle(fontFamily: 'Lato-Bold'),
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) => const OrderItem()),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
