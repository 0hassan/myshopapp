import 'package:flutter/material.dart';
import 'package:myshopapp/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id, title, pid;
  final double price;
  final int quantity;
  const CartItem({
    Key? key,
    required this.pid,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              size: 40,
              color: Colors.white,
            ),
          ],
        ),
        //alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        color: Colors.red,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItemFromCart(pid);
      },
      child: Card(
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
      ),
    );
  }
}
