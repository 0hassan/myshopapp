import 'package:flutter/material.dart';
import './screens/main_products_page/mainproductsscreen.dart';

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
      ),
      routes: {
        '/': (context) => MainProductsScreen(),
      },
    );
  }
}
