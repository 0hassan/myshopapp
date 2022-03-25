import 'package:flutter/material.dart';
import 'package:myshopapp/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsDetailScreen extends StatelessWidget {
  static const routeName = '/products_details_screen';
  const ProductsDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final item = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.title,
        ),
      ),
      body: const Text('hello'),
    );
  }
}
