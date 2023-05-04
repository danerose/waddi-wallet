import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:waddi_wallet_app/app/data/datasources/remote/coins.remote.service.impl.dart';
import 'package:waddi_wallet_app/app/data/repositories/coins.repository.impl.dart';
import 'package:waddi_wallet_app/app/domain/datasources/remote/coins/coins.remote.service.dart';
import 'package:waddi_wallet_app/app/domain/repositories/coins.repository.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/get_coins.usecase.dart';

import 'package:waddi_wallet_app/core/config/size/size.config.dart';
import 'package:waddi_wallet_app/core/constants/coinstats_api.constants.dart';

import 'package:waddi_wallet_app/core/enum/enviroment.enum.dart';

import 'package:waddi_wallet_app/core/constants/colors.constants.dart';

import 'package:waddi_wallet_app/core/services/db/hive.service.dart';
import 'package:waddi_wallet_app/core/services/network/network.services.dart';

final injector = GetIt.instance;

Future<void> initDependencies(EnviromentEnum env) async {
  injector.registerSingleton<Dio>(Dio());

  injector.registerSingleton<SizeConfig>(SizeConfig());
  injector.registerSingleton<ColorsConstants>(ColorsConstants(env: env));
  injector.registerSingleton<CoinstatsApiConstants>(CoinstatsApiConstants(
    env: env,
  ));

  injector.registerSingleton<DioService>(
    DioService(
      baseUrl: injector.get<CoinstatsApiConstants>().baseUrl,
      lang: window.locale,
      dio: injector.get<Dio>(),
    ),
  );

  injector.registerSingleton<HiveService>(HiveService());

  injector.registerLazySingleton<CoinsRemoteService>(
    () => CoinsRemoteServiceImpl(dio: injector.get<DioService>()),
  );

  injector.registerLazySingleton<CoinstRepository>(
    () => CoinsRepositoryImpl(
      coinsRemoteService: injector.get<CoinsRemoteService>(),
    ),
  );

  injector.registerLazySingleton<GetCoinsUsecase>(
    () => GetCoinsUsecase(
      coinstRepository: injector.get<CoinstRepository>(),
    ),
  );
}
