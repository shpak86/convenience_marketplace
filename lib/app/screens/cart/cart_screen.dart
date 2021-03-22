import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _mainContainer(context);
  }

  Widget _mainContainer(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Icon(
        Icons.shopping_cart_outlined,
        size: 100,
        color: Colors.blue,
      ),
    ));
  }
}
