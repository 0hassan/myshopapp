import 'package:flutter/material.dart';
import 'package:myshopapp/providers/main_products_modal.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/main_products_item.dart';

class MainProductsScreen extends StatelessWidget {
  const MainProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SK-Products'),
      ),
      body: const GridviewBuilder(),
    );
  }
}

class GridviewBuilder extends StatelessWidget {
  const GridviewBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listdata = Provider.of<ProductsProvider>(context);
    final list = listdata.list;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider(
          create: (context) => list[index],
          child: const MainProductItem(),
        );
      },
      itemCount: list.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
