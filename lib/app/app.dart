import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:waddi_wallet_app/core/config/theme/theme.config.dart';
import 'package:waddi_wallet_app/core/config/routes/routes.config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet',
      initialRoute: '/',
      themeMode: ThemeMode.dark,
      theme: CustomTheme.light(),
      darkTheme: CustomTheme.dark(),
      locale: window.locale,
      onGenerateRoute: RouteGenerator.generateRoutes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
