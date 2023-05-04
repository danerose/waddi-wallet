import 'package:flutter/material.dart';

class ErrorTextAtom extends StatelessWidget {
  const ErrorTextAtom({super.key, this.background = false, required this.text});

  final bool background;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}
