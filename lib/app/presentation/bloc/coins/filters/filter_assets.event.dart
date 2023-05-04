import 'package:equatable/equatable.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/core/enum/assets_filters.enum.dart';

abstract class FilterAssetsEvent extends Equatable {
  const FilterAssetsEvent();
  @override
  List<Object?> get props => [];
}

class FilterAssetsEventSort extends FilterAssetsEvent {
  const FilterAssetsEventSort({required this.filter, required this.list});
  final AssetsFilterEnum filter;
  final List<CoinEntity> list;
}

class FilterAssetsEventSetFilter extends FilterAssetsEvent {
  const FilterAssetsEventSetFilter({required this.filter});
  final AssetsFilterEnum filter;
}
