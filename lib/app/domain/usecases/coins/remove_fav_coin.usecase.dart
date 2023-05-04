import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/domain/repositories/coins.repository.dart';

class RemoveFavCoinsUsecase {
  final CoinstRepository coinstRepository;
  const RemoveFavCoinsUsecase({required this.coinstRepository});

  Future<void> execute({
    required CoinEntity coin,
  }) async {
    await coinstRepository.removeFavoriteCoin(coin: coin);
  }
}
