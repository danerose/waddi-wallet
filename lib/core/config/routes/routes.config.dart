import 'package:flutter/material.dart';

import 'package:waddi_wallet_app/app/injector.dart';

import 'package:waddi_wallet_app/core/config/size/size.config.dart';
import 'package:waddi_wallet_app/core/constants/routes.constants.dart';

import 'package:waddi_wallet_app/app/presentation/views/splash/splash.view.dart';
import 'package:waddi_wallet_app/app/presentation/views/home/home.view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.initial:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.initial),
          builder: (BuildContext context) {
            injector<SizeConfig>().init(context);
            return const SplashView();
          },
        );
      case RoutesConstants.home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.home),
          builder: (BuildContext context) {
            injector<SizeConfig>().init(context);
            return const HomeView();
          },
        );
      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (BuildContext _) {
        return const Scaffold(
          body: Center(
            child: Text('Error, Page not found'),
          ),
        );
      },
    );
  }
}
