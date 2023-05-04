import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/core/utils/validators.util.dart';

class CoinModel extends CoinEntity {
  const CoinModel({
    required String id,
    required String icon,
    required String name,
    required String symbol,
    required int rank,
    required num price,
    required num priceBtc,
    required num volume,
    required num marketCap,
    required num availableSupply,
    required num totalSupply,
    required num priceChange1h,
    required num priceChange1d,
    required num priceChange1w,
    required String websiteUrl,
    required String redditUrl,
    required String twitterUrl,
    required List<String> exp,
  }) : super(
          id: id,
          icon: icon,
          name: name,
          symbol: symbol,
          rank: rank,
          price: price,
          priceBtc: priceBtc,
          volume: volume,
          marketCap: marketCap,
          availableSupply: availableSupply,
          totalSupply: totalSupply,
          priceChange1h: priceChange1h,
          priceChange1d: priceChange1d,
          priceChange1w: priceChange1w,
          websiteUrl: websiteUrl,
          redditUrl: redditUrl,
          twitterUrl: twitterUrl,
          exp: exp,
        );

  factory CoinModel.fromJson(Map<String, dynamic>? json) {
    return CoinModel(
      id: ValidatorUtils.containsKeyReturn<String>(json, 'id', ''),
      icon: ValidatorUtils.containsKeyReturn<String>(json, 'icon', ''),
      name: ValidatorUtils.containsKeyReturn<String>(json, 'name', ''),
      symbol: ValidatorUtils.containsKeyReturn<String>(json, 'symbol', ''),
      rank: ValidatorUtils.containsKeyReturn<int>(json, 'rank', 0),
      price: ValidatorUtils.containsKeyReturn<num>(json, 'price', 0),
      priceBtc: ValidatorUtils.containsKeyReturn<num>(
        json,
        'priceBtc',
        0,
      ),
      volume: ValidatorUtils.containsKeyReturn<num>(json, 'volume', 0),
      marketCap: ValidatorUtils.containsKeyReturn<num>(json, 'marketCap', 0),
      availableSupply: ValidatorUtils.containsKeyReturn<num>(
        json,
        'availableSupply',
        0,
      ),
      totalSupply: ValidatorUtils.containsKeyReturn<num>(
        json,
        'totalSupply',
        0,
      ),
      priceChange1h: ValidatorUtils.containsKeyReturn<num>(
        json,
        'priceChange1h',
        0,
      ),
      priceChange1d: ValidatorUtils.containsKeyReturn<num>(
        json,
        'priceChange1d',
        0,
      ),
      priceChange1w: ValidatorUtils.containsKeyReturn<num>(
        json,
        'priceChange1w',
        0,
      ),
      websiteUrl: ValidatorUtils.containsKeyReturn<String>(
        json,
        'websiteUrl',
        '',
      ),
      redditUrl: ValidatorUtils.containsKeyReturn<String>(
        json,
        'redditUrl',
        '',
      ),
      twitterUrl: ValidatorUtils.containsKeyReturn<String>(
        json,
        'twitterUrl',
        '',
      ),
      exp: List<String>.from(
        ValidatorUtils.containsKeyReturn(json, 'exp', []).map(
          (e) => e,
        ),
      ),
    );
  }
}
