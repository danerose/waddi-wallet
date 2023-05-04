import 'package:flutter/material.dart';

class ThemeButtonMolecule extends StatelessWidget {
  const ThemeButtonMolecule({
    super.key,
    required this.size,
    required this.brightness,
    required this.onTap,
  });

  final double size;
  final Brightness brightness;
  final Function(Brightness brightness) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          onTap(brightness);
        },
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: SizedBox(
              child: Visibility(
                visible: brightness == Brightness.light,
                replacement: const Icon(Icons.light_mode_rounded),
                child: const Icon(
                  Icons.dark_mode_rounded,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
