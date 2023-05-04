import 'package:equatable/equatable.dart';
import 'package:waddi_wallet_app/app/data/models/coin/coin.model.dart';

class CoinEntity extends Equatable {
  final String id;
  final String icon;
  final String name;
  final String symbol;
  final int rank;
  final double price;
  final int priceBtc;
  final double volume;
  final double marketCap;
  final double availableSupply;
  final double totalSupply;
  final double priceChange1h;
  final double priceChange1d;
  final double priceChange1w;
  final String websiteUrl;
  final String redditUrl;
  final String twitterUrl;
  final List<String> exp;

  const CoinEntity({
    required this.id,
    required this.icon,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.price,
    required this.priceBtc,
    required this.volume,
    required this.marketCap,
    required this.availableSupply,
    required this.totalSupply,
    required this.priceChange1h,
    required this.priceChange1d,
    required this.priceChange1w,
    required this.websiteUrl,
    required this.redditUrl,
    required this.twitterUrl,
    required this.exp,
  });

  factory CoinEntity.fromModel(CoinModel model) {
    return CoinEntity(
      id: model.id,
      icon: model.icon,
      name: model.name,
      symbol: model.symbol,
      rank: model.rank,
      price: model.price,
      priceBtc: model.priceBtc,
      volume: model.volume,
      marketCap: model.marketCap,
      availableSupply: model.availableSupply,
      totalSupply: model.totalSupply,
      priceChange1h: model.priceChange1h,
      priceChange1d: model.priceChange1d,
      priceChange1w: model.priceChange1w,
      websiteUrl: model.websiteUrl,
      redditUrl: model.redditUrl,
      twitterUrl: model.twitterUrl,
      exp: model.exp,
    );
  }

  @override
  List<Object?> get props => [
        id,
        icon,
        name,
        symbol,
        rank,
        price,
        priceBtc,
        volume,
        marketCap,
        availableSupply,
        totalSupply,
        priceChange1h,
        priceChange1d,
        priceChange1w,
        websiteUrl,
        redditUrl,
        twitterUrl,
        exp,
      ];
}
