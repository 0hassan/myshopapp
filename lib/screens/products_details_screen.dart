import 'package:flutter/material.dart';

class ProductsDetailScreen extends StatelessWidget {
  static const routeName = '/products_details_screen';
  const ProductsDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'title',
        ),
      ),
      body: const Text('hello'),
    );
  }
}
