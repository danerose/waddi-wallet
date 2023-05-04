import 'package:flutter/material.dart';

import 'package:waddi_wallet_app/core/services/db/hive.service.dart';

import 'package:waddi_wallet_app/core/constants/box.constants.dart';

import 'package:waddi_wallet_app/app/data/db/config/config.dao.dart';

import 'package:waddi_wallet_app/app/domain/datasources/local/config/config.local.service.dart';

class ConfigLocalServiceImpl implements ConfigLocalService {
  final HiveService hive;
  const ConfigLocalServiceImpl({required this.hive});

  @override
  Future<void> deleteLocalConfig() async {
    await hive.putBox<ConfigDao>(
      BoxConstants.config,
      const ConfigDao(
        currency: '',
        theme: ThemeMode.system,
      ),
    );
  }

  @override
  Future<ConfigDao> getLocalConfig() async {
    final config = await hive.getBox<ConfigDao>(BoxConstants.config);
    return config ?? const ConfigDao(currency: '', theme: ThemeMode.system);
  }

  @override
  Future<void> setLocalConfig(ConfigDao config) async {
    await hive.putBox<ConfigDao>(BoxConstants.config, config);
  }
}
