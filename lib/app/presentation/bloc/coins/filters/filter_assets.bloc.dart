import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.state.dart';
import 'package:waddi_wallet_app/core/enum/assets_filters.enum.dart';

class FilterAssetsBloc extends Bloc<FilterAssetsEvent, FilterAssetsState> {
  FilterAssetsBloc() : super(const FilterAssetsState()) {
    on<FilterAssetsEventSetFilter>(_onSetFilter);
    on<FilterAssetsEventSort>(_onSortCoins);
  }

  void _onSetFilter(
    FilterAssetsEventSetFilter event,
    Emitter<FilterAssetsState> emit,
  ) async {
    emit(state.copyWith(filter: event.filter));
  }

  Future<void> _onSortCoins(
    FilterAssetsEventSort event,
    Emitter<FilterAssetsState> emit,
  ) async {
    final list = event.list.removeWhere((e) => e.liked);
    switch (event.filter) {
      case AssetsFilterEnum.toAtoZ:
        emit(state.copyWith(
          showFilteredL: true,
          filter: AssetsFilterEnum.toAtoZ,
          filteredList: [],
        ));
        break;
      case AssetsFilterEnum.toZtoA:
        emit(state.copyWith(
          showFilteredL: true,
          filter: AssetsFilterEnum.toZtoA,
          filteredList: [],
        ));
        break;
      case AssetsFilterEnum.toLowerPtoHigherP:
        emit(state.copyWith(
          showFilteredL: true,
          filter: AssetsFilterEnum.toLowerPtoHigherP,
          filteredList: [],
        ));
        break;
      case AssetsFilterEnum.toHigherPtoLowerP:
        emit(state.copyWith(
          showFilteredL: true,
          filter: AssetsFilterEnum.toHigherPtoLowerP,
          filteredList: [],
        ));
        break;
      default:
        emit(state.copyWith(
          showFilteredL: false,
          filter: AssetsFilterEnum.none,
          filteredList: [],
        ));
    }
  }
}
