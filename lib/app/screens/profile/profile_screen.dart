import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _mainContainer(context);
  }

  Widget _mainContainer(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_circle,
            color: Colors.indigo,
            size: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 20, color: Colors.indigo),
            ),
          )
        ],
      ),
    );
  }
}
