import 'package:equatable/equatable.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/core/enum/assets_filters.enum.dart';

class FilterAssetsState extends Equatable {
  const FilterAssetsState({
    this.showFilteredL = false,
    this.filteredList = const [],
    this.filter = AssetsFilterEnum.none,
  });

  final bool showFilteredL;
  final List<CoinEntity> filteredList;
  final AssetsFilterEnum filter;

  FilterAssetsState copyWith({
    bool? showFilteredL,
    List<CoinEntity>? filteredList,
    AssetsFilterEnum? filter,
  }) {
    return FilterAssetsState(
      showFilteredL: showFilteredL ?? this.showFilteredL,
      filter: filter ?? this.filter,
      filteredList: filteredList ?? this.filteredList,
    );
  }

  @override
  List<Object?> get props => [filter, showFilteredL, filteredList];
}
