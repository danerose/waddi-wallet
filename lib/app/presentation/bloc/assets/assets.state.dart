import 'package:equatable/equatable.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/core/enum/exceptions.enum.dart';

class AssetsState extends Equatable {
  const AssetsState({
    this.skip = 0,
    this.limit = 10,
    this.status = 0,
    this.loading = false,
    this.list = const [],
    this.error = ExceptionEnum.none,
  });

  final int skip;
  final int limit;
  final int status;
  final bool loading;
  final List<CoinEntity> list;
  final ExceptionEnum error;

  AssetsState copyWith({
    int? skip,
    int? limit,
    int? status,
    bool? loading,
    List<CoinEntity>? list,
    ExceptionEnum? error,
  }) {
    return AssetsState(
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
      status: status ?? this.status,
      loading: loading ?? this.loading,
      list: list ?? this.list,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [skip, limit, status, loading, list, error];
}
