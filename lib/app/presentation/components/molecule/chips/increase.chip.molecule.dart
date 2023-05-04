import 'package:flutter/material.dart';

class IncreaseChipMolecule extends StatelessWidget {
  const IncreaseChipMolecule({
    super.key,
    required this.normalColor,
    required this.increaseColor,
    required this.decreaseColor,
    required this.data,
  });

  final Color normalColor;
  final Color decreaseColor;
  final Color increaseColor;
  final double data;

  @override
  Widget build(BuildContext context) {
    if (data > 0) {
      return Container(
        decoration: BoxDecoration(
          color: increaseColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Text(
            '+${data.toString()}',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: increaseColor),
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Text(
            '$data',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: decreaseColor),
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Text(
            '$data',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: normalColor),
          ),
        ),
      );
    }
  }
}
