import 'package:flutter_test/flutter_test.dart';
import 'package:waddi_wallet_app/app/data/models/coin/coin.model.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';

void main() {
  const coinJson = <String, dynamic>{
    'id': '1',
    'icon': 'icon',
    'name': 'name',
    'symbol': 'symbol',
    'rank': 1,
    'price': 1,
    'priceBtc': 1,
    'volume': 1,
    'marketCap': 1,
    'availableSupply': 1,
    'totalSupply': 1,
    'priceChange1h': 1,
    'priceChange1d': 1,
    'priceChange1w': 1,
    'websiteUrl': 'websiteUrl',
    'redditUrl': 'redditUrl',
    'twitterUrl': 'twitterUrl',
    'liked': false,
    'exp': [],
  };
  const coinModel = CoinModel(
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

  group('from Model', () {
    test(
      'should be a subclass of config entity',
      () async {
        // assert
        final result = CoinEntity.fromModel(coinModel);
        expect(result, equals(coinEntity));
      },
    );
  });
  group('from Json', () {
    test(
      'should be a subclass of config model',
      () async {
        // assert
        final result = CoinModel.fromJson(coinJson);
        expect(result, equals(coinModel));
      },
    );
  });
}
