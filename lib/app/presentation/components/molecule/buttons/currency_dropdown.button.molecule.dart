import 'package:flutter/material.dart';
import 'package:waddi_wallet_app/core/constants/currency.constants.dart';

class CurrencyDropdownButtonMolecule extends StatelessWidget {
  const CurrencyDropdownButtonMolecule({
    super.key,
    required this.currency,
    required this.onChanged,
  });

  final String currency;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      elevation: 0,
      underline: const SizedBox.shrink(),
      value: currency,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: [
        CurrencyConstants.usd.toUpperCase(),
        CurrencyConstants.eur.toUpperCase(),
      ].map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? value) {
        if (value != null && value != currency) {
          onChanged(value);
        }
      },
    );
  }
}
