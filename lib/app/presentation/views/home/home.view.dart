import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/config/config.bloc.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.state.dart';

import 'package:waddi_wallet_app/app/presentation/components/molecule/buttons/theme.button.molecule.dart';
import 'package:waddi_wallet_app/app/presentation/components/organism/list/home_assets.list.organism.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AssetsBloc>(context)
        ..add(
          AssestEventInit(
            currency: context.read<ConfigBloc>().state.currency,
          ),
        ),
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
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: const [HomeAssetsListsOrganism()],
            ),
          ),
        ),
      ),
    );
  }
}
