import 'package:flutter/material.dart';
import 'package:waddi_wallet_app/app/app.dart';
import 'package:waddi_wallet_app/app/injector.dart';

import 'package:waddi_wallet_app/core/enum/enviroment.enum.dart';

import 'package:waddi_wallet_app/core/services/db/hive.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies(EnviromentEnum.production);
  await injector.get<HiveService>().init();
  runApp(const App());
}
