import 'package:flutter/material.dart';

class IncreaseChipMolecule extends StatelessWidget {
  const IncreaseChipMolecule({
    super.key,
    this.fontSize = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    required this.normalColor,
    required this.increaseColor,
    required this.decreaseColor,
    required this.data,
  });

  final Color normalColor;
  final Color decreaseColor;
  final Color increaseColor;
  final double data;
  final double fontSize;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    if (data > 0) {
      return Container(
        decoration: BoxDecoration(
          color: increaseColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            '+${data.toString()}',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: increaseColor, fontSize: fontSize),
          ),
        ),
      );
    } else if (data < 0) {
      return Container(
        decoration: BoxDecoration(
          color: decreaseColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            '$data',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: decreaseColor, fontSize: fontSize),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: normalColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            '$data',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: normalColor, fontSize: fontSize),
          ),
        ),
      );
    }
  }
}
