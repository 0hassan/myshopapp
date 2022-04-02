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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                item.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Lato-Regular',
                fontSize: 26,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Lato-Regular',
                fontSize: 14,
                color: Colors.red,
              ),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
