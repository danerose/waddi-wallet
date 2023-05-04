import 'package:waddi_wallet_app/app/domain/datasources/remote/coins/coins.remote.service.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:dartz/dartz.dart';
import 'package:waddi_wallet_app/app/domain/repositories/coins.repository.dart';
import 'package:waddi_wallet_app/core/exceptions/custom.exceptions.dart';

class CoinsRepositoryImpl implements CoinstRepository {
  final CoinsRemoteService coinsRemoteService;
  const CoinsRepositoryImpl({required this.coinsRemoteService});
  @override
  Future<Either<CustomException, List<CoinEntity>>> getCoins({
    required int skip,
    required int limit,
  }) async {
    try {
      final res = await coinsRemoteService.getCoins(skip: skip, limit: limit);
      return Right(res.map((e) => CoinEntity.fromModel(e)).toList());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CustomException.unknown(e: e));
    }
  }
}
