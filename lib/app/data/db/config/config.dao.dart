import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'config.dao.g.dart';

@HiveType(typeId: 0)
class ConfigDao {
  @HiveField(0)
  final ThemeMode theme;

  @HiveField(1)
  final String currency;

  const ConfigDao({
    required this.theme,
    required this.currency,
  });
}
