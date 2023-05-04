import 'package:dartz/dartz.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/domain/repositories/coins.repository.dart';
import 'package:waddi_wallet_app/core/exceptions/custom.exceptions.dart';

class GetCoinsUsecase {
  final CoinstRepository coinstRepository;
  const GetCoinsUsecase({required this.coinstRepository});

  Future<Either<CustomException, List<CoinEntity>>> execute({
    required int skip,
    required int limit,
  }) async {
    return await coinstRepository.getCoins(skip: skip, limit: limit);
  }
}
