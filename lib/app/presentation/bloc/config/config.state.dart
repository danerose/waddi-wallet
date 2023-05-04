import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:waddi_wallet_app/core/constants/currency.constants.dart';

class ConfigState extends Equatable {
  const ConfigState({
    this.route = '',
    this.theme = ThemeMode.system,
    this.currency = CurrencyConstants.usd,
  });

  final String route;
  final ThemeMode theme;
  final String currency;

  ConfigState copyWith({
    String? route,
    ThemeMode? theme,
    String? currency,
  }) {
    return ConfigState(
      route: route ?? this.route,
      theme: theme ?? this.theme,
      currency: currency ?? this.currency,
    );
  }

  @override
  List<Object?> get props => [route, theme, currency];
}
