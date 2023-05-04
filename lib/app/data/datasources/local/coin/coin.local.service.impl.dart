import 'package:waddi_wallet_app/app/data/db/coin/coin.dao.dart';
import 'package:waddi_wallet_app/core/constants/box.constants.dart';
import 'package:waddi_wallet_app/core/services/db/hive.service.dart';
import 'package:waddi_wallet_app/app/domain/datasources/local/coin/coin.local.service.dart';

class CoinLocalServiceImpl implements CoinLocalService {
  final HiveService hive;
  const CoinLocalServiceImpl({required this.hive});

  @override
  Future<void> addFavorite({required CoinDao coin}) async {
    List<CoinDao> list = await hive.getBox<List<CoinDao>>(
          BoxConstants.favCoins,
        ) ??
        [];
    list.add(coin);
    await hive.putBox<List<CoinDao>>(BoxConstants.favCoins, list);
  }

  @override
  Future<List<CoinDao>> getFavoritesCoin() async {
    final list = await hive.getBox<List<CoinDao>>(
      BoxConstants.favCoins,
    );
    return list ?? [];
  }

  @override
  Future<void> removeFavorite({required CoinDao coin}) async {
    final list = await hive.getBox<List<CoinDao>>(
          BoxConstants.favCoins,
        ) ??
        [];
    list.removeWhere((e) => e.id == coin.id);
    await hive.putBox<List<CoinDao>>(BoxConstants.favCoins, list);
  }
}
