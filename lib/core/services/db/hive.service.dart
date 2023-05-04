import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart' as path;
import 'package:waddi_wallet_app/app/data/db/coin/coin.dao.dart';
import 'package:waddi_wallet_app/app/data/db/config/config.dao.dart';
import 'package:waddi_wallet_app/core/constants/box.constants.dart';

class HiveService {
  Future<void> init() async {
    final directory = await path.getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    await _registerAdapters();
    await _initBoxes();
  }

  Future<void> _registerAdapters() async {
    Hive.registerAdapter(ConfigDaoAdapter());
    Hive.registerAdapter(CoinDaoAdapter());
  }

  Future<void> _initBoxes() async {
    await Hive.openBox<ConfigDao>(BoxConstants.config);
    await Hive.openBox<List<CoinDao>>(BoxConstants.favCoins);
  }

  Future<void> addBox<T>(String name, T value) async {
    final box = Hive.box<T>(name);
    await box.add(value);
  }

  Future<T?> getBox<T>(String name) async {
    final box = Hive.box<T>(name);
    return box.get(name);
  }

  Future<void> putBox<T>(String name, T value) async {
    final box = Hive.box<T>(name);
    await box.put(name, value);
  }
}
