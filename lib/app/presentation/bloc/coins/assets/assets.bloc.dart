import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:waddi_wallet_app/core/enum/exceptions.enum.dart';
import 'package:waddi_wallet_app/core/exceptions/custom.exceptions.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.state.dart';

import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/get_coins.usecase.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final GetCoinsUsecase _getCoinsUsecase;

  AssetsBloc(
    this._getCoinsUsecase,
  ) : super(const AssetsState()) {
    on<AssestEventInit>(_onInit);
    on<AssestEventAddToFav>(_onAddFav);
    on<AssestEventRemoveFromFav>(_onRemoveFav);
  }

  Future<void> _onInit(
    AssestEventInit event,
    Emitter<AssetsState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: event.showLoading,
        currency: event.currency,
        coins: [],
      ),
    );

    final res = await _getCoinsUsecase.execute(
      skip: state.skip,
      limit: state.limit,
      currency: event.currency,
    );

    res.fold((CustomException l) {
      emit(state.copyWith(
        status: l.status,
        error: l.error,
        loading: false,
      ));
    }, (List<CoinEntity> r) {
      List<CoinEntity> favs = [];
      for (var i = 0; i < state.favs.length; i++) {
        for (var x = 0; x < r.length; x++) {
          if (state.favs[i].id == r[x].id) {
            r[x] = r[x].copyWith(liked: true);
            favs.add(r[x]);
          }
        }
      }
      emit(state.copyWith(
        status: 200,
        coins: r,
        favs: favs,
        loading: false,
        error: ExceptionEnum.none,
      ));
    });
  }

  Future<void> _onAddFav(
    AssestEventAddToFav event,
    Emitter<AssetsState> emit,
  ) async {
    final coin = state.coins[event.index].copyWith(liked: true);
    state.coins[event.index] = coin;
    emit(state.copyWith(coins: state.coins));
    emit(state.copyWith(favs: [...state.favs, coin]));
  }

  Future<void> _onRemoveFav(
    AssestEventRemoveFromFav event,
    Emitter<AssetsState> emit,
  ) async {
    final index = state.coins.indexWhere((e) => e.id == event.id);
    final coin = state.coins[index].copyWith(liked: false);
    state.coins[index] = coin;
    final favs = state.favs;
    final coins = state.coins;
    favs.removeWhere((e) => e.id == event.id);
    emit(state.copyWith(favs: [], coins: []));
    emit(state.copyWith(favs: favs));
    emit(state.copyWith(coins: coins));
  }
}
