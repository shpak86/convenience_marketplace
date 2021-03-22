import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _mainContainer(context);
  }

  Widget _mainContainer(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Icon(
        Icons.favorite,
        size: 100,
        color: Colors.red,
      ),
    ));
  }
}
