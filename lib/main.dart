import 'package:convenience_marketplace/app/screens/products/details/product_details_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/list/shops_list_screen.dart';
import 'package:convenience_marketplace/app/widgets/rating_bar/rating_bar.dart';
import 'package:convenience_marketplace/app/widgets/shops/shops_list_item_widget.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:flutter/material.dart';

import 'app/screens/products/list/products_list_screen.dart';

void main() {
  DependencyProvider();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      routes: {
        ShopsListScreen.route: (context) => ShopsListScreen(),
        ShopDetailsScreen.route: (context) => ShopDetailsScreen(),
        ProductsListScreen.route: (context) => ProductsListScreen(),
        ProductDetailsScreen.route: (context) => ProductDetailsScreen(),
      },
      home: ShopsListScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: RatingBar(
                3.813,
                length: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
