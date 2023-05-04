import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart' as path;

class HiveService {
  Future<void> init() async {
    final directory = await path.getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);
    await _registerAdapters();
    await _initBoxes();
  }

  Future<void> _registerAdapters() async {}

  Future<void> _initBoxes() async {}

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
