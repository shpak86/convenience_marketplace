import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  String _label;
  String _imageUri;
  String _categoryUri;
  Color _color;

  CategoryCard(
    this._label, {
    String imageUri,
    categoryUri = "",
    Color color,
  }) {
    _imageUri = imageUri ?? "assets/images/default-category.png";
    _categoryUri = categoryUri ?? "";
    _color = color ?? Colors.blue.shade50;
  }

  @override
  Widget build(BuildContext context) {
    return _mainContainer();
  }

  Widget _mainContainer() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.grey),
              color: _color,
            ),
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  _imageUri,
                )),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _label,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget imageContainer() => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/product-default.png'),
            fit: BoxFit.contain,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(color: Colors.grey),
          color: Colors.blue.shade200,
        ),
      );
}
