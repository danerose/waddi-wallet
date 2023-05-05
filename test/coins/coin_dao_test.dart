import 'package:flutter_test/flutter_test.dart';
import 'package:waddi_wallet_app/app/data/db/coin/coin.dao.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';

void main() {
  const coinDao = CoinDao(
    id: '1',
    icon: 'icon',
    name: 'name',
    symbol: 'symbol',
    rank: 1,
    price: 1,
    priceBtc: 1,
    volume: 1,
    marketCap: 1,
    availableSupply: 1,
    totalSupply: 1,
    priceChange1h: 1,
    priceChange1d: 1,
    priceChange1w: 1,
    websiteUrl: 'websiteUrl',
    redditUrl: 'redditUrl',
    twitterUrl: 'twitterUrl',
    liked: false,
    exp: [],
  );

  const coinEntity = CoinEntity(
    id: '1',
    icon: 'icon',
    name: 'name',
    symbol: 'symbol',
    rank: 1,
    price: 1,
    priceBtc: 1,
    volume: 1,
    marketCap: 1,
    availableSupply: 1,
    totalSupply: 1,
    priceChange1h: 1,
    priceChange1d: 1,
    priceChange1w: 1,
    websiteUrl: 'websiteUrl',
    redditUrl: 'redditUrl',
    twitterUrl: 'twitterUrl',
    liked: false,
    exp: [],
  );

  group('from Dao', () {
    test(
      'should be a subclass of config entity',
      () async {
        // assert
        final result = CoinEntity.fromDao(coinDao);
        expect(result, equals(coinEntity));
      },
    );
  });
}
