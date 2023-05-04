import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:waddi_wallet_app/app/injector.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/config/config.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.state.dart';

import 'package:waddi_wallet_app/core/constants/colors.constants.dart';
import 'package:waddi_wallet_app/core/constants/icons.constants.dart';
import 'package:waddi_wallet_app/core/constants/routes.constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConfigBloc, ConfigState>(
      listenWhen: (p, c) => p.route != c.route,
      listener: (BuildContext context, ConfigState state) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesConstants.home,
          (route) => false,
        );
      },
      child: Scaffold(
        backgroundColor: injector.get<ColorsConstants>().primary,
        body: Stack(
          children: [
            Center(
              child: SvgPicture.asset(IconsConstants.waddiNamedLogoIcon),
            ),
            const Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: ColorsConstants.white,
                    strokeWidth: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
