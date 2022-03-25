import 'package:flutter/material.dart';

import './screens/products_details_screen.dart';
import 'screens/main_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SK-Products',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lime)
            .copyWith(secondary: Colors.purple),
        fontFamily: 'Lato',
      ),
      routes: {
        '/': (context) => MainProductsScreen(),
        ProductsDetailScreen.routeName: (context) =>
            const ProductsDetailScreen(),
      },
    );
  }
}
