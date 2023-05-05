import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.state.dart';
import 'package:waddi_wallet_app/core/enum/assets_filters.enum.dart';

class FilterAssetsBloc extends Bloc<FilterAssetsEvent, FilterAssetsState> {
  FilterAssetsBloc() : super(const FilterAssetsState()) {
    on<FilterAssetsEventSetFilter>(_onSetFilter);
    on<FilterAssetsEventSort>(_onSortCoins);
    on<FilterAssetsEventResetFilter>(_onResetFilter);
  }

  void _onSetFilter(
    FilterAssetsEventSetFilter event,
    Emitter<FilterAssetsState> emit,
  ) async {
    emit(state.copyWith(filter: event.filter));
  }

  void _onResetFilter(
    FilterAssetsEventResetFilter event,
    Emitter<FilterAssetsState> emit,
  ) async {
    emit(
      state.copyWith(
        filter: AssetsFilterEnum.none,
        filteredList: [],
        showFilteredL: false,
      ),
    );
  }

  Future<void> _onSortCoins(
    FilterAssetsEventSort event,
    Emitter<FilterAssetsState> emit,
  ) async {
    final list = event.list;
    if (list.isNotEmpty) {
      emit(state.copyWith(showFilteredL: false));
      list.removeWhere((e) => e.liked);
      switch (event.filter) {
        case AssetsFilterEnum.toAtoZ:
          list.sort((a, b) {
            return a.name.compareTo(b.name);
          });
          emit(state.copyWith(
            showFilteredL: true,
            filter: AssetsFilterEnum.toAtoZ,
            filteredList: list,
          ));
          break;
        case AssetsFilterEnum.toZtoA:
          list.sort((a, b) {
            return b.name.compareTo(a.name);
          });
          emit(state.copyWith(
            showFilteredL: true,
            filter: AssetsFilterEnum.toZtoA,
            filteredList: list,
          ));
          break;
        case AssetsFilterEnum.toLowerPtoHigherP:
          list.sort((a, b) {
            return a.price.compareTo(b.price);
          });
          emit(state.copyWith(
            showFilteredL: true,
            filter: AssetsFilterEnum.toLowerPtoHigherP,
            filteredList: list,
          ));
          break;
        case AssetsFilterEnum.toHigherPtoLowerP:
          list.sort((a, b) {
            return b.price.compareTo(a.price);
          });
          emit(state.copyWith(
            showFilteredL: true,
            filter: AssetsFilterEnum.toHigherPtoLowerP,
            filteredList: list,
          ));
          break;
        default:
          emit(state.copyWith(
            showFilteredL: false,
            filter: AssetsFilterEnum.none,
            filteredList: [],
          ));
          break;
      }
    }
  }
}
