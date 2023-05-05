import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();
  @override
  List<Object?> get props => [];
}

class ConfigEventInit extends ConfigEvent {
  const ConfigEventInit();
}

class ConfigEventChangeTheme extends ConfigEvent {
  const ConfigEventChangeTheme({required this.theme});
  final ThemeMode theme;
}
class ConfigEventChangeCurrency extends ConfigEvent {
  const ConfigEventChangeCurrency({required this.currency});
  final String currency;
}
