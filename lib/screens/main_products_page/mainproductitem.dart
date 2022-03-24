import 'package:flutter/material.dart';

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
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                size: 24,
              )),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 24,
              )),
          title: Text(
            title,
            //textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black45,
        ),
      ),
    );
  }
}
