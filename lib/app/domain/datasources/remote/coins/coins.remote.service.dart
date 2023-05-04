import 'package:waddi_wallet_app/app/data/models/coin/coin.model.dart';

abstract class CoinsRemoteService {
  Future<List<CoinModel>> getCoins({
    required int skip,
    required int limit,
    required String currency,
  });
}
