import 'package:convenience_marketplace/app/screens/cart/cart_screen.dart';
import 'package:convenience_marketplace/app/screens/catalog/catalog_screen.dart';
import 'package:convenience_marketplace/app/screens/favorites/favorites_screen.dart';
import 'package:convenience_marketplace/app/screens/profile/profile_screen.dart';
import 'package:convenience_marketplace/app/screens/shops/list/shops_list_screen.dart';
import 'package:flutter/material.dart';

class NavigatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigatorScreenState();
  }
}

class NavigatorScreenState extends State<NavigatorScreen> {
  int _selectedIndex = 2;
  List<Widget> screens = [
    ShopsListScreen(),
    FavoritesScreen(),
    CatalogScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenBody(context),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shops',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Catalog',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.indigo,
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
