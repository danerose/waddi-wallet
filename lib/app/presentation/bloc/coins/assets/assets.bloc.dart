import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waddi_wallet_app/app/domain/usecases/coins/add_fav_coin.usecase.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/get_fav_coins.usecase.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/remove_fav_coin.usecase.dart';

import 'package:waddi_wallet_app/core/enum/exceptions.enum.dart';
import 'package:waddi_wallet_app/core/exceptions/custom.exceptions.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.state.dart';

import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/get_coins.usecase.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final GetCoinsUsecase _getCoinsUsecase;
  final AddFavCoinsUsecase _addFavCoinsUsecase;
  final GetFavCoinsUsecase _getFavCoinsUsecase;
  final RemoveFavCoinsUsecase _removeFavCoinsUsecase;

  AssetsBloc(
    this._getCoinsUsecase,
    this._addFavCoinsUsecase,
    this._getFavCoinsUsecase,
    this._removeFavCoinsUsecase,
  ) : super(const AssetsState()) {
    on<AssestEventInit>(_onInit);
    on<AssestEventAddToFav>(_onAddFav);
    on<AssestEventRemoveFromFav>(_onRemoveFav);
  }

  Future<void> _onInit(
    AssestEventInit event,
    Emitter<AssetsState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
      currency: event.currency,
    ));

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
      emit(state.copyWith(
        status: 200,
        coins: r,
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
    final coin = state.coins[event.index].copyWith(liked: false);
    state.coins[event.index] = coin;
    state.favs.removeWhere((e) => e.id == event.id);
    emit(state.copyWith(favs: [...state.favs]));
    emit(state.copyWith(coins: state.coins));
  }
}
