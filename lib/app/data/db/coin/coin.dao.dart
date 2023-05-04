import 'package:hive_flutter/hive_flutter.dart';

part 'coin.dao.g.dart';

@HiveType(typeId: 1)
class CoinDao {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String icon;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String symbol;
  @HiveField(4)
  final int rank;
  @HiveField(5)
  final num price;
  @HiveField(6)
  final num priceBtc;
  @HiveField(7)
  final num volume;
  @HiveField(8)
  final num marketCap;
  @HiveField(9)
  final num availableSupply;
  @HiveField(10)
  final num totalSupply;
  @HiveField(11)
  final num priceChange1h;
  @HiveField(12)
  final num priceChange1d;
  @HiveField(13)
  final num priceChange1w;
  @HiveField(14)
  final String websiteUrl;
  @HiveField(15)
  final String redditUrl;
  @HiveField(16)
  final String twitterUrl;
  @HiveField(17)
  final bool liked;
  @HiveField(18)
  final List<String> exp;

  const CoinDao({
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
}
