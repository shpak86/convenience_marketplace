import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _mainContainer(context);
  }

  Widget _mainContainer(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Icon(
        Icons.search,
        size: 100,
        color: Colors.amber,
      ),
    ));
  }
}
