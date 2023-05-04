import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/domain/repositories/coins.repository.dart';

class GetFavCoinsUsecase {
  final CoinstRepository coinstRepository;
  const GetFavCoinsUsecase({required this.coinstRepository});

  Future<List<CoinEntity>> execute() async {
    return await coinstRepository.getFavoritesCoins();
  }
}
