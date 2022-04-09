import 'package:flutter/material.dart';
import 'package:myshopapp/screens/edit_product_screen.dart';

class UserProducts extends StatelessWidget {
  final String img, title;
  const UserProducts({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(img),
        ),
        title: Text(title,
            style: const TextStyle(
              fontFamily: 'Anton-Regular',
            )),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
