import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/core/constants/routes.constants.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.state.dart';

import 'package:waddi_wallet_app/app/domain/usecases/config/get_config.usecase.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final GetConfigUsecase _getConfigUsecase;

  ConfigBloc(this._getConfigUsecase) : super(const ConfigState()) {
    on<ConfigEventInit>(_onInit);
    on<ConfigEventChangeTheme>(_onChangeTheme);
  }

  Future<void> _onInit(
    ConfigEventInit event,
    Emitter<ConfigState> emit,
  ) async {
    final config = await _getConfigUsecase.execute();
    await Future.delayed(
      const Duration(milliseconds: 2000),
      () async {},
    );
    emit(state.copyWith(
      theme: config.theme,
      currency: config.currency,
      route: RoutesConstants.home,
    ));
  }

  Future<void> _onChangeTheme(
    ConfigEventChangeTheme event,
    Emitter<ConfigState> emit,
  ) async {
    log('${event.theme.name}');
    emit(state.copyWith(
      theme: event.theme,
    ));
  }
}
