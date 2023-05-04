import 'package:flutter/material.dart';
import 'package:waddi_wallet_app/app/injector.dart';
import 'package:waddi_wallet_app/core/constants/colors.constants.dart';

final ThemeData walletDark = ThemeData(
  fontFamily: 'Alexandria',
  brightness: Brightness.light,
  colorSchemeSeed: injector.get<ColorsConstants>().primary,
);
