import 'package:flutter/material.dart';
import 'package:myshopapp/providers/main_products_modal.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/main_products_item.dart';

// enum FilterOptions {
//   favorite,
//   all,
// }

class MainProductsScreen extends StatefulWidget {
  const MainProductsScreen({Key? key}) : super(key: key);

  @override
  State<MainProductsScreen> createState() => _MainProductsScreenState();
}

class _MainProductsScreenState extends State<MainProductsScreen> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SK-Products'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('All Items'),
                value: 0,
              ),
              const PopupMenuItem(
                child: Text('Only Favorite'),
                value: 1,
              ),
            ],
            icon: const Icon(Icons.more_vert),
            onSelected: (int selected) {
              setState(() {
                if (selected == 1) {
                  _isFavorite = true;
                } else {
                  _isFavorite = false;
                }
              });
            },
          ),
        ],
      ),
      body: GridviewBuilder(this._isFavorite),
    );
  }
}

// ignore: must_be_immutable
class GridviewBuilder extends StatelessWidget {
  bool xyz;
  // ignore: use_key_in_widget_constructors
  GridviewBuilder(
    this.xyz, {
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    final listdata = Provider.of<ProductsProvider>(context);
    // print(_isfavorite);
    late List<MainProductModal> list;

    if (xyz) {
      list = listdata.favoritelist;
    } else {
      list = listdata.list;
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: list[index],
          child: const MainProductItem(),
        );
      },
      itemCount: list.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
