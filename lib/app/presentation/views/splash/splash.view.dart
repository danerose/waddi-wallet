import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waddi_wallet_app/app/injector.dart';
import 'package:waddi_wallet_app/core/constants/colors.constants.dart';
import 'package:waddi_wallet_app/core/constants/icons.constants.dart';
import 'package:waddi_wallet_app/core/constants/routes.constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        milliseconds: 2000,
      ),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesConstants.home,
          (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
