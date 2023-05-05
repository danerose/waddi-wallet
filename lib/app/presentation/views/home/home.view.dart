import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/timer_assets.cubit.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/config/config.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.state.dart';
import 'package:waddi_wallet_app/app/presentation/components/molecule/buttons/currency_dropdown.button.molecule.dart';

import 'package:waddi_wallet_app/app/presentation/components/molecule/buttons/theme.button.molecule.dart';
import 'package:waddi_wallet_app/app/presentation/components/organism/list/home_assets.list.organism.dart';
import 'package:waddi_wallet_app/app/presentation/components/organism/list/home_fav_assets.list.organism.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<AssetsBloc>(context)
            ..add(
              AssestEventInit(
                showLoading: true,
                currency: context.read<ConfigBloc>().state.currency,
              ),
            ),
        ),
        BlocProvider<TimerAssetsCubit>(
          create: (_) => TimerAssetsCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: BlocBuilder<ConfigBloc, ConfigState>(
            buildWhen: (p, c) => p.theme != c.theme,
            builder: (BuildContext context, ConfigState state) {
              if (state.theme.name == 'system') {
                return ThemeButtonMolecule(
                  size: 10,
                  brightness:
                      SchedulerBinding.instance.window.platformBrightness,
                  onTap: (Brightness brightness) {
                    if (brightness == Brightness.light) {
                      context.read<ConfigBloc>().add(
                            const ConfigEventChangeTheme(theme: ThemeMode.dark),
                          );
                    } else {
                      context.read<ConfigBloc>().add(
                            const ConfigEventChangeTheme(
                                theme: ThemeMode.light),
                          );
                    }
                  },
                );
              } else {
                return ThemeButtonMolecule(
                  size: 10,
                  brightness: state.theme.name == 'dark'
                      ? Brightness.dark
                      : Brightness.light,
                  onTap: (Brightness brightness) {
                    if (brightness == Brightness.light) {
                      context.read<ConfigBloc>().add(
                            const ConfigEventChangeTheme(theme: ThemeMode.dark),
                          );
                    } else {
                      context.read<ConfigBloc>().add(
                            const ConfigEventChangeTheme(
                              theme: ThemeMode.light,
                            ),
                          );
                    }
                  },
                );
              }
            },
          ),
          actions: [
            BlocListener<TimerAssetsCubit, int>(
              listener: (BuildContext context, int state) {
                if (state == 0) {
                  context.read<TimerAssetsCubit>().starTimer();
                  context.read<AssetsBloc>().add(
                        AssestEventInit(
                          showLoading: false,
                          currency: context.read<ConfigBloc>().state.currency,
                        ),
                      );
                }
              },
              child: BlocBuilder<TimerAssetsCubit, int>(
                // bloc: context.read<TimerAssetsCubit>().starTimer(60),
                builder: (BuildContext context, int state) {
                  return Text('$state s');
                },
              ),
            ),
            BlocBuilder<ConfigBloc, ConfigState>(
              buildWhen: (p, c) => p.currency != c.currency,
              builder: (BuildContext context, ConfigState config) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CurrencyDropdownButtonMolecule(
                    currency: config.currency,
                    onChanged: (String value) {
                      context.read<ConfigBloc>().add(
                            ConfigEventChangeCurrency(currency: value),
                          );
                      context.read<AssetsBloc>().add(
                            AssestEventInit(showLoading: true, currency: value),
                          );
                    },
                  ),
                );
              },
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: const [
                HomeFavAssetsListOrganism(),
                HomeAssetsListsOrganism()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
