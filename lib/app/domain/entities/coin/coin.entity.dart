import 'package:equatable/equatable.dart';
import 'package:waddi_wallet_app/app/data/db/coin/coin.dao.dart';
import 'package:waddi_wallet_app/app/data/models/coin/coin.model.dart';

class CoinEntity extends Equatable {
  final String id;
  final String icon;
  final String name;
  final String symbol;
  final int rank;
  final num price;
  final num priceBtc;
  final num volume;
  final num marketCap;
  final num availableSupply;
  final num totalSupply;
  final num priceChange1h;
  final num priceChange1d;
  final num priceChange1w;
  final String websiteUrl;
  final String redditUrl;
  final String twitterUrl;
  final bool liked;
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
    required this.liked,
    required this.exp,
  });

  CoinEntity copyWith({
    String? id,
    String? icon,
    String? name,
    String? symbol,
    int? rank,
    num? price,
    num? priceBtc,
    num? volume,
    num? marketCap,
    num? availableSupply,
    num? totalSupply,
    num? priceChange1h,
    num? priceChange1d,
    num? priceChange1w,
    String? websiteUrl,
    String? redditUrl,
    String? twitterUrl,
    bool? liked,
    List<String>? exp,
  }) {
    return CoinEntity(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      rank: rank ?? this.rank,
      price: price ?? this.price,
      priceBtc: priceBtc ?? this.price,
      volume: volume ?? this.volume,
      marketCap: marketCap ?? this.marketCap,
      availableSupply: availableSupply ?? this.availableSupply,
      totalSupply: totalSupply ?? this.totalSupply,
      priceChange1h: priceChange1h ?? this.priceChange1h,
      priceChange1d: priceChange1d ?? this.priceChange1h,
      priceChange1w: priceChange1w ?? this.priceChange1w,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      redditUrl: redditUrl ?? this.redditUrl,
      twitterUrl: twitterUrl ?? this.twitterUrl,
      liked: liked ?? this.liked,
      exp: exp ?? this.exp,
    );
  }

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
      liked: model.liked,
      exp: model.exp,
    );
  }
  factory CoinEntity.fromDao(CoinDao dao) {
    return CoinEntity(
      id: dao.id,
      icon: dao.icon,
      name: dao.name,
      symbol: dao.symbol,
      rank: dao.rank,
      price: dao.price,
      priceBtc: dao.priceBtc,
      volume: dao.volume,
      marketCap: dao.marketCap,
      availableSupply: dao.availableSupply,
      totalSupply: dao.totalSupply,
      priceChange1h: dao.priceChange1h,
      priceChange1d: dao.priceChange1d,
      priceChange1w: dao.priceChange1w,
      websiteUrl: dao.websiteUrl,
      redditUrl: dao.redditUrl,
      twitterUrl: dao.twitterUrl,
      liked: dao.liked,
      exp: dao.exp,
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
        liked,
        exp,
      ];
}
