import 'package:flutter/material.dart';
import 'package:myshopapp/providers/main_products_modal.dart';
import 'package:provider/provider.dart';
import '../screens/products_details_screen.dart';

class MainProductItem extends StatelessWidget {
  const MainProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<MainProductModal>(context);
    return GridTile(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductsDetailScreen.routeName,
              arguments: item.id,
            );
          },
          child: Image.network(
            item.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(
          leading: IconButton(
              onPressed: () {
                item.togleFavorite();
              },
              icon: Icon(
                item.isFavorite ? Icons.favorite : Icons.favorite_border,
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
            item.title,
            //textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
