import 'package:convenience_marketplace/app/screens/cart/cart_screen.dart';
import 'package:convenience_marketplace/app/screens/favorites/favorites_screen.dart';
import 'package:convenience_marketplace/app/screens/seach/search_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/list/shops_list_screen.dart';
import 'package:flutter/material.dart';

class NavigatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigatorScreenState();
  }
}

class NavigatorScreenState extends State<NavigatorScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    ShopsListScreen(),
    SearchScreen(),
    FavoritesScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Shops")),
      body: _screenBody(context),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shops',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,

        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _screenBody(BuildContext context) {
    return screens[_selectedIndex];
  }
}
