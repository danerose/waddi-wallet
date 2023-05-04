import 'dart:ui';

import 'package:waddi_wallet_app/core/enum/enviroment.enum.dart';

class ColorsConstants {
  final EnviromentEnum env;
  const ColorsConstants({required this.env});

  Color get primary {
    switch (env) {
      case EnviromentEnum.development:
        return const Color(0xFF3a246e);
      case EnviromentEnum.stagin:
        return const Color(0xFF3a246e);
      default:
        return const Color(0xFF3a246e);
    }
  }

  Color get second {
    switch (env) {
      case EnviromentEnum.development:
        return const Color(0xFF3a246e);
      case EnviromentEnum.stagin:
        return const Color(0xFF3a246e);
      default:
        return const Color(0xFF3a246e);
    }
  }

  Color get input {
    switch (env) {
      case EnviromentEnum.development:
        return const Color(0xFF3a246e);
      case EnviromentEnum.stagin:
        return const Color(0xFF3a246e);
      default:
        return const Color(0xFF3a246e);
    }
  }

  static const Color background = Color.fromARGB(255, 31, 24, 31);
  static const Color textAlt = Color.fromARGB(255, 163, 137, 163);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color disabled = Color.fromARGB(255, 212, 205, 205);
  static const Color grey = Color.fromARGB(255, 100, 100, 100);
  static const Color transparent = Color.fromARGB(0, 255, 255, 255);
  static const Color success = Color.fromRGBO(102, 206, 106, 1);
  static const Color error = Color.fromRGBO(244, 62, 80, 1);
  static const Color warning = Color.fromRGBO(196, 160, 3, 1);
}
