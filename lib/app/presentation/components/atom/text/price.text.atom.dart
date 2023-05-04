import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceTextAtom extends StatelessWidget {
  const PriceTextAtom({
    super.key,
    required this.price,
    required this.format,
    this.fontSize = 14,
  });

  final num price;
  final String format;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      NumberFormat.simpleCurrency(
        name: format.toUpperCase(),
      ).format(price),
      style: TextStyle(fontSize: fontSize),
    );
  }
}
