import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/core/utils/validators.util.dart';

class CoinModel extends CoinEntity {
  const CoinModel({
    required String id,
    required String icon,
    required String name,
    required String symbol,
    required int rank,
    required double price,
    required int priceBtc,
    required double volume,
    required double marketCap,
    required double availableSupply,
    required double totalSupply,
    required double priceChange1h,
    required double priceChange1d,
    required double priceChange1w,
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
      id: ValidatorUtils.containsKeyReturn(json, 'id', ''),
      icon: ValidatorUtils.containsKeyReturn(json, 'icon', ''),
      name: ValidatorUtils.containsKeyReturn(json, 'name', ''),
      symbol: ValidatorUtils.containsKeyReturn(json, 'symbol', ''),
      rank: int.parse(ValidatorUtils.containsKeyReturn(json, 'rank', 0)),
      price: double.parse(ValidatorUtils.containsKeyReturn(json, 'price', '0')),
      priceBtc: int.parse(ValidatorUtils.containsKeyReturn(
        json,
        'priceBtc',
        0,
      )),
      volume: double.parse(
        ValidatorUtils.containsKeyReturn(json, 'volume', '0'),
      ),
      marketCap: double.parse(
          ValidatorUtils.containsKeyReturn(json, 'marketCap', '0')),
      availableSupply: double.parse(
        ValidatorUtils.containsKeyReturn(json, 'availableSupply', '0'),
      ),
      totalSupply: double.parse(
        ValidatorUtils.containsKeyReturn(json, 'totalSupply', '0'),
      ),
      priceChange1h: double.parse(
        ValidatorUtils.containsKeyReturn(json, 'priceChange1h', '0'),
      ),
      priceChange1d: double.parse(
        ValidatorUtils.containsKeyReturn(json, 'priceChange1d', '0'),
      ),
      priceChange1w: double.parse(
        ValidatorUtils.containsKeyReturn(json, 'priceChange1w', '0'),
      ),
      websiteUrl: ValidatorUtils.containsKeyReturn(json, 'websiteUrl', ''),
      redditUrl: ValidatorUtils.containsKeyReturn(json, 'redditUrl', ''),
      twitterUrl: ValidatorUtils.containsKeyReturn(json, 'twitterUrl', ''),
      exp: ValidatorUtils.containsKeyReturn(json, 'exp', []),
    );
  }
}
