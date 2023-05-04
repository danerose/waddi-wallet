import 'package:waddi_wallet_app/app/data/models/coin/coin.model.dart';
import 'package:waddi_wallet_app/app/domain/datasources/remote/coins/coins.remote.service.dart';
import 'package:waddi_wallet_app/core/constants/coinstats_api.constants.dart';
import 'package:waddi_wallet_app/core/services/network/network.services.dart';

class CoinsRemoteServiceImpl implements CoinsRemoteService {
  final DioService dio;

  const CoinsRemoteServiceImpl({required this.dio});

  @override
  Future<List<CoinModel>> getCoins({
    required int skip,
    required int limit,
  }) async {
    try {
      final res = await dio.get(CoinstatsApiConstants.coins, queryParameters: {
        'skip': skip,
        'limit': limit,
      });
      return List<CoinModel>.from(res.data['coins'].map(
        (e) => CoinModel.fromJson(e),
      ));
    } catch (e) {
      rethrow;
    }
  }
}
