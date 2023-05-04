import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:waddi_wallet_app/app/data/db/config/config.dao.dart';
import 'package:waddi_wallet_app/core/constants/currency.constants.dart';

class ConfigEntity extends Equatable {
  const ConfigEntity({
    this.theme = ThemeMode.system,
    this.currency = CurrencyConstants.usd,
  });

  final ThemeMode theme;
  final String currency;

  factory ConfigEntity.fromDao(ConfigDao dao) {
    return ConfigEntity(
      currency: dao.currency,
      theme: dao.theme,
    );
  }

  @override
  List<Object?> get props => [theme, currency];
}
