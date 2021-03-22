import 'package:convenience_marketplace/app/screens/navigator/NavigatorScreen.dart';
import 'package:convenience_marketplace/app/screens/products/details/product_details_screen.dart';
import 'package:convenience_marketplace/app/screens/products/rating/product_rating_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/details/shop_details_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/list/shops_list_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/rating/shop_rating_screen.dart';
import 'package:convenience_marketplace/app/widgets/rating_selector/rating_selector.dart';
import 'package:convenience_marketplace/di/dependency_provider.dart';
import 'package:flutter/material.dart';

import 'app/screens/products/list/products_list_screen.dart';

void main() {
  DependencyProvider();
  runApp(MarketApp());
}

class MarketApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convenience market',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        ShopsListScreen.route: (context) => ShopsListScreen(),
        ShopDetailsScreen.route: (context) => ShopDetailsScreen(),
        ProductsListScreen.route: (context) => ProductsListScreen(),
        ProductDetailsScreen.route: (context) => ProductDetailsScreen(),
        ShopRatingScreen.route: (context) => ShopRatingScreen(),
        ProductRatingScreen.route: (context) => ProductRatingScreen(),
      },
      home: NavigatorScreen(),
      // home: ShopRatingScreen(),
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
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Flexible(child: RatingSelector()),
            ),
          ],
        ),
      ),
    );
  }
}
