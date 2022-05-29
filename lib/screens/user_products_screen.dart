import 'package:flutter/material.dart';
import 'package:myshopapp/providers/products_provider.dart';
import 'package:myshopapp/screens/edit_product_screen.dart';
import 'package:myshopapp/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/user_products.dart';

class UserProductsScreen extends StatelessWidget {
  static const namedRoute = '/userproductsscreen';
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products!'),
        actions: [
          IconButton(
            onPressed: (() {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: '');
            }),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const DrawerX(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: ((_, index) => UserProducts(
                img: productsData.list[index].imgUrl,
                title: productsData.list[index].title,
                id: productsData.list[index].id,
              )),
          itemCount: productsData.list.length,
        ),
      ),
    );
  }
}
