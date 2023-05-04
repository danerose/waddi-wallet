import 'package:waddi_wallet_app/core/enum/enviroment.enum.dart';

class CoinstatsApiConstants {
  final EnviromentEnum env;
  const CoinstatsApiConstants({required this.env});

  String get baseUrl {
    switch (env) {
      case EnviromentEnum.development:
        return 'https://api.coinstats.app/public/v1';
      case EnviromentEnum.stagin:
        return 'https://api.coinstats.app/public/v1';
      default:
        return 'https://api.coinstats.app/public/v1';
    }
  }

  static const String coins = '/coins';
}
