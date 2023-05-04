import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/domain/usecases/coins/get_coins.usecase.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/assets/assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/assets/assets.state.dart';
import 'package:waddi_wallet_app/core/enum/exceptions.enum.dart';
import 'package:waddi_wallet_app/core/exceptions/custom.exceptions.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final GetCoinsUsecase _getCoinsUsecase;

  AssetsBloc(this._getCoinsUsecase) : super(const AssetsState()) {
    on<AssestEventInit>(_onInit);
  }

  Future<void> _onInit(
    AssestEventInit event,
    Emitter<AssetsState> emit,
  ) async {
    final res = await _getCoinsUsecase.execute(
      skip: state.skip,
      limit: state.limit,
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
        list: r,
        loading: false,
        error: ExceptionEnum.none,
      ));
    });
  }
}
