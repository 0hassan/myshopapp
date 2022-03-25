import 'package:flutter/material.dart';
import '../screens/products_details_screen.dart';

class MainProductItem extends StatelessWidget {
  final String id, title, imgUrl;
  const MainProductItem({
    Key? key,
    required this.id,
    required this.imgUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductsDetailScreen.routeName);
          },
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              )),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              )),
          title: Text(
            title,
            //textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
