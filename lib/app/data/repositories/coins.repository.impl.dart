import 'package:waddi_wallet_app/app/data/db/coin/coin.dao.dart';
import 'package:waddi_wallet_app/app/domain/datasources/local/coin/coin.local.service.dart';
import 'package:waddi_wallet_app/app/domain/datasources/remote/coins/coins.remote.service.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:dartz/dartz.dart';
import 'package:waddi_wallet_app/app/domain/repositories/coins.repository.dart';
import 'package:waddi_wallet_app/core/exceptions/custom.exceptions.dart';

class CoinsRepositoryImpl implements CoinstRepository {
  final CoinLocalService coinLocalService;
  final CoinsRemoteService coinsRemoteService;
  const CoinsRepositoryImpl({
    required this.coinLocalService,
    required this.coinsRemoteService,
  });
  @override
  Future<Either<CustomException, List<CoinEntity>>> getCoins({
    required int skip,
    required int limit,
    required String currency,
  }) async {
    try {
      final res = await coinsRemoteService.getCoins(
        skip: skip,
        limit: limit,
        currency: currency,
      );
      return Right(res.map((e) => CoinEntity.fromModel(e)).toList());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CustomException.unknown(e: e));
    }
  }

  @override
  Future<void> addFavoriteCoin({required CoinEntity coin}) async {
    await coinLocalService.addFavorite(
      coin: CoinDao(
        id: coin.id,
        icon: coin.icon,
        name: coin.name,
        symbol: coin.symbol,
        rank: coin.rank,
        price: coin.price,
        priceBtc: coin.priceBtc,
        volume: coin.volume,
        marketCap: coin.marketCap,
        availableSupply: coin.availableSupply,
        totalSupply: coin.totalSupply,
        priceChange1h: coin.priceChange1h,
        priceChange1d: coin.priceChange1d,
        priceChange1w: coin.priceChange1w,
        websiteUrl: coin.websiteUrl,
        redditUrl: coin.redditUrl,
        twitterUrl: coin.twitterUrl,
        liked: coin.liked,
        exp: coin.exp,
      ),
    );
  }

  @override
  Future<List<CoinEntity>> getFavoritesCoins() async {
    final list = await coinLocalService.getFavoritesCoin();
    return List<CoinEntity>.from(list.map((e) => CoinEntity.fromDao(e)));
  }

  @override
  Future<void> removeFavoriteCoin({required CoinEntity coin}) async {
    await coinLocalService.removeFavorite(
      coin: CoinDao(
        id: coin.id,
        icon: coin.icon,
        name: coin.name,
        symbol: coin.symbol,
        rank: coin.rank,
        price: coin.price,
        priceBtc: coin.priceBtc,
        volume: coin.volume,
        marketCap: coin.marketCap,
        availableSupply: coin.availableSupply,
        totalSupply: coin.totalSupply,
        priceChange1h: coin.priceChange1h,
        priceChange1d: coin.priceChange1d,
        priceChange1w: coin.priceChange1w,
        websiteUrl: coin.websiteUrl,
        redditUrl: coin.redditUrl,
        twitterUrl: coin.twitterUrl,
        liked: coin.liked,
        exp: coin.exp,
      ),
    );
  }
}
