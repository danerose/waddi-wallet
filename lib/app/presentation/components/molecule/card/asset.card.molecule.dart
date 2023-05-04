import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/components/atom/image/network_image.atom.dart';
import 'package:waddi_wallet_app/app/presentation/components/atom/text/price.text.atom.dart';
import 'package:waddi_wallet_app/app/presentation/components/molecule/chips/increase.chip.molecule.dart';
import 'package:waddi_wallet_app/core/constants/colors.constants.dart';

class AssetCardMolecule extends StatelessWidget {
  const AssetCardMolecule({
    super.key,
    required this.coin,
    required this.onLikePressed,
    required this.onCardPressed,
  });

  final CoinEntity coin;
  final Function(bool liked) onLikePressed;
  final Function() onCardPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onCardPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          child: Row(
            children: [
              NetworkImageAtom(
                width: 30,
                height: 30,
                borderRadius: BorderRadius.circular(100),
                url: coin.icon,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(coin.name),
                        PriceTextAtom(
                          price: coin.price,
                          format: context.read<ConfigBloc>().state.currency,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          coin.symbol,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: ColorsConstants.textAlt,
                                  ),
                        ),
                        IncreaseChipMolecule(
                          normalColor: ColorsConstants.grey,
                          increaseColor: ColorsConstants.success,
                          decreaseColor: ColorsConstants.error,
                          data: double.parse(coin.priceChange1h.toString()),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Visibility(
                visible: coin.liked,
                replacement: IconButton(
                  onPressed: () => onLikePressed(coin.liked),
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                ),
                child: IconButton(
                  onPressed: () => onLikePressed(
                    coin.liked,
                  ),
                  icon: const Icon(
                    color: ColorsConstants.error,
                    Icons.favorite,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
