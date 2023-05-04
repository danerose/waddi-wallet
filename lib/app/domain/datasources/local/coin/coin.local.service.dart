import 'package:waddi_wallet_app/app/data/db/coin/coin.dao.dart';

abstract class CoinLocalService {
  Future<void> addFavorite({required CoinDao coin});
  Future<void> removeFavorite({required CoinDao coin});
  Future<List<CoinDao>> getFavoritesCoin();
}
