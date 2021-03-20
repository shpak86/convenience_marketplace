import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  double _rating;
  int _length;
  Color _color;
  List<IconData> _items = [];

  RatingBar(rating, {int length = 5, Color color = Colors.orange}) {
    this._rating = rating;
    this._length = length;
    this._color = color;

    if (_rating == null || _rating == 0) {
      for (int i = 1; i <= _length; i++) {
        _items.add(Icons.star_border_rounded);
      }
      _color = Colors.grey;
    } else {
      for (int i = 1; i <= _length; i++) {
        if (i <= _rating) {
          _items.add(Icons.star_rounded);
        } else if (_rating < i && i < _rating + 1.0) {
          _items.add(Icons.star_half_rounded);
        } else {
          _items.add(Icons.star_border_rounded);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Row(mainAxisSize: MainAxisSize.min, children: _items.map((item) => Icon(item, color: _color)).toList()));
  }
}
