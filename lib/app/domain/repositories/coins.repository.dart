import 'package:dartz/dartz.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/core/exceptions/custom.exceptions.dart';

abstract class CoinstRepository {
  Future<Either<CustomException, List<CoinEntity>>> getCoins({
    required int skip,
    required int limit,
    required String currency,
  });
}
