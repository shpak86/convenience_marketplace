import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartButtonWidget extends StatelessWidget {
  Function _onCartTap;
  String _price;
  String _units;
  Color _backgroundColor;
  Color _overlayColor;
  double _borderRadius;
  Color _textColor;

  CartButtonWidget(
    String price,
    String units, {
    Function onTap,
    backgroundColor,
    overlayColor,
    borderRadius,
    textColor,
  }) {
    _onCartTap = onTap ?? () {};
    _price = price;
    _units = units;
    _backgroundColor = _backgroundColor ?? Colors.green;
    _overlayColor = overlayColor ?? Colors.white.withOpacity(0.2);
    _borderRadius = borderRadius ?? 20.0;
    _textColor = textColor ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _onCartTap,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(_overlayColor),
        backgroundColor: MaterialStateProperty.all<Color>(_backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
            side: BorderSide(color: _backgroundColor),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_shopping_cart,
            color: _textColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: productPriceLabel(context),
          )
        ],
      ),
    );
  }

  Widget productPriceLabel(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: RichText(
          text: TextSpan(
            text: "\$$_price",
            style: GoogleFonts.lato(textStyle: TextStyle(color: _textColor, fontWeight: FontWeight.bold, fontSize: 14)),
            children: <TextSpan>[
              TextSpan(text: " / ", style: TextStyle(color: _textColor, fontWeight: FontWeight.normal)),
              TextSpan(text: _units, style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.caption).merge(TextStyle(color: _textColor)))
            ],
          ),
        ),
      );
}
