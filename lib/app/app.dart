import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/app/injector.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.bloc.dart';

import 'package:waddi_wallet_app/core/config/theme/theme.config.dart';
import 'package:waddi_wallet_app/core/config/routes/routes.config.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/config/config.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.state.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.bloc.dart';

import 'package:waddi_wallet_app/app/domain/usecases/coins/get_coins.usecase.dart';
import 'package:waddi_wallet_app/app/domain/usecases/config/get_config.usecase.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/add_fav_coin.usecase.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/get_fav_coins.usecase.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/remove_fav_coin.usecase.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConfigBloc>(
          create: (_) => ConfigBloc(
            injector.get<GetConfigUsecase>(),
          )..add(const ConfigEventInit()),
        ),
        BlocProvider<AssetsBloc>(
          create: (_) => AssetsBloc(
            injector.get<GetCoinsUsecase>(),
            injector.get<AddFavCoinsUsecase>(),
            injector.get<GetFavCoinsUsecase>(),
            injector.get<RemoveFavCoinsUsecase>(),
          ),
        ),
        BlocProvider(
          create: (_) => FilterAssetsBloc(),
        )
      ],
      child: BlocBuilder<ConfigBloc, ConfigState>(
        buildWhen: (p, c) {
          return p.theme != c.theme;
        },
        builder: (BuildContext context, ConfigState config) {
          return MaterialApp(
            title: 'Wallet',
            initialRoute: '/',
            themeMode: config.theme,
            theme: CustomTheme.light(),
            darkTheme: CustomTheme.dark(),
            locale: window.locale,
            onGenerateRoute: RouteGenerator.generateRoutes,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
