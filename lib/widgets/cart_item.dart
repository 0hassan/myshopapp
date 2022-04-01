import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String id, title;
  final double price;
  final int quantity;
  const CartItemWidget({
    Key? key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          selectedTileColor: Theme.of(context).colorScheme.secondary,
          style: ListTileStyle.list,
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Container(
              child: FittedBox(
                child: Text('\$$price'),
              ),
              margin: const EdgeInsets.all(5),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
