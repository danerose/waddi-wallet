import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/injector.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/components/atom/image/network_image.atom.dart';
import 'package:waddi_wallet_app/app/presentation/components/atom/text/price.text.atom.dart';
import 'package:waddi_wallet_app/app/presentation/components/molecule/chips/increase.chip.molecule.dart';
import 'package:waddi_wallet_app/core/config/size/size.config.dart';
import 'package:waddi_wallet_app/core/constants/colors.constants.dart';

class FavcAssetCardMolecule extends StatelessWidget {
  const FavcAssetCardMolecule({
    super.key,
    required this.coin,
    required this.onLikePressed,
    required this.onFavPressed,
  });

  final CoinEntity coin;
  final Function(bool liked) onLikePressed;
  final Function() onFavPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsConstants.textAlt.withOpacity(0.2),
      ),
      width: injector.get<SizeConfig>().sizeHorizontal * 22,
      height: injector.get<SizeConfig>().sizeHorizontal * 22,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onFavPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NetworkImageAtom(
                width: 24,
                height: 24,
                borderRadius: BorderRadius.circular(100),
                url: coin.icon,
              ),
              const SizedBox(width: 10),
              PriceTextAtom(
                fontSize: 10,
                price: coin.price,
                format: context.watch<ConfigBloc>().state.currency,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    coin.symbol,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: ColorsConstants.textAlt,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(width: 5),
                  IncreaseChipMolecule(
                    fontSize: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3,
                      vertical: 0,
                    ),
                    normalColor: ColorsConstants.grey,
                    increaseColor: ColorsConstants.success,
                    decreaseColor: ColorsConstants.error,
                    data: double.parse(coin.priceChange1h.toString()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
