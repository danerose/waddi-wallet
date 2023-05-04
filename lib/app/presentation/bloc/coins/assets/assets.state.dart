import 'package:equatable/equatable.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/core/constants/currency.constants.dart';
import 'package:waddi_wallet_app/core/enum/exceptions.enum.dart';

class AssetsState extends Equatable {
  const AssetsState({
    this.skip = 0,
    this.limit = 10,
    this.status = 0,
    this.currency = CurrencyConstants.usd,
    this.loading = false,
    this.coins = const [],
    this.favs = const [],
    this.error = ExceptionEnum.none,
  });

  final int skip;
  final int limit;
  final int status;
  final String currency;
  final bool loading;
  final List<CoinEntity> coins;
  final List<CoinEntity> favs;
  final ExceptionEnum error;

  AssetsState copyWith({
    int? skip,
    int? limit,
    int? status,
    String? currency,
    bool? loading,
    List<CoinEntity>? coins,
    List<CoinEntity>? favs,
    ExceptionEnum? error,
  }) {
    return AssetsState(
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
      status: status ?? this.status,
      currency: currency ?? this.currency,
      loading: loading ?? this.loading,
      coins: coins ?? this.coins,
      favs: favs ?? this.favs,
      error: error ?? this.error,
    );
  }

  List<CoinEntity> copyListItemWith({
    required int index,
    required String id,
    required CoinEntity coin,
  }) {
    coins[index] = coin;
    return coins;
  }
  
  

  @override
  List<Object?> get props => [
        skip,
        limit,
        status,
        currency,
        loading,
        coins,
        favs,
        error,
      ];
}
