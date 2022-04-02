import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/order.dart' as prd;

class OrderItem extends StatelessWidget {
  final prd.OrderItem orderdata;
  const OrderItem({Key? key, required this.orderdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text('${orderdata.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(orderdata.dateTime),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        //color: Colors.red,
        border: Border.all(
          color: Colors.lime,
          width: 2,
        ),
      ),
    );
  }
}
