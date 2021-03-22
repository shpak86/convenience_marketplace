import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingSelector extends StatefulWidget {
  int _maxValue;

  RatingSelector({int maxValue = 5}) {
    _maxValue = maxValue;
  }

  @override
  State<StatefulWidget> createState() {
    return RatingSelectorState(_maxValue);
  }
}

class RatingSelectorState extends State<RatingSelector> {
  int _rating = 0;
  int _maxValue;

  RatingSelectorState(this._maxValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: itemsList(),
      ),
    );
  }

  List<Widget> itemsList() {
    List<Widget> row = [];
    for (int i = 1; i <= _maxValue; i++) {
      row.add(
        IconButton(
          icon: Icon(
            getIcon(i),
            color: Colors.amber,
          ),
          onPressed: () => setState(() {
            _rating = i;
          }),
        ),
      );
    }
    return row;
  }

  IconData getIcon(int index) {
    if (index <= _rating) {
      return Icons.star_rounded;
    } else {
      return Icons.star_border_rounded;
    }
  }
}
