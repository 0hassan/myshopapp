import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../providers/order.dart' as prd;

class OrderItem extends StatefulWidget {
  final prd.OrderItem orderdata;
  const OrderItem({Key? key, required this.orderdata}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            // selectedColor: Colors.greenAccent,
            // focusColor: Colors.lime,
            // hoverColor: Colors.lightBlue,
            // tileColor: Colors.redAccent,
            // selectedTileColor: Colors.red,
            title: Text('${widget.orderdata.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.orderdata.dateTime),
            ),
            trailing: IconButton(
              icon: !_expanded
                  ? const Icon(
                      Icons.expand_more,
                      color: Colors.black,
                    )
                  : const Icon(Icons.expand_less, color: Colors.black),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.all(8),
              height: min(widget.orderdata.products.length * 20 + 15, 180),
              margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(8.0),
              //   border: Border.all(
              //       color: Colors.lime, style: BorderStyle.solid, width: 2.0),
              // ),
              child: ListView.builder(
                itemBuilder: ((context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.orderdata.products[index].title,
                          style: const TextStyle(
                            fontFamily: 'Lato_Bold',
                            fontSize: 18,
                            color: Colors.lightGreen,
                          ),
                        ),
                        Text(
                          '${widget.orderdata.products[index].quantity}x\$${widget.orderdata.products[index].price}',
                        ),
                      ],
                    )),
                itemCount: widget.orderdata.products.length,
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
