import 'package:flutter/material.dart';
import 'package:myshopapp/screens/order_screen.dart';
import 'package:myshopapp/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

import 'package:myshopapp/providers/cart.dart';
import 'package:myshopapp/providers/order.dart';
import 'package:myshopapp/providers/products_provider.dart';

import 'package:myshopapp/screens/cart_screen.dart';
import './screens/products_details_screen.dart';
import 'screens/main_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'SK-Products',
        theme: ThemeData(
          primaryColor: Colors.lime,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lime)
              .copyWith(secondary: Colors.lightGreen),
          fontFamily: 'Lato-Bold',
        ),
        routes: {
          '/': (context) => const MainProductsScreen(),
          ProductsDetailScreen.routeName: (context) =>
              const ProductsDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          UserProductsScreen.namedRoute: (context) =>
              const UserProductsScreen(),
        },
      ),
    );
  }
}
