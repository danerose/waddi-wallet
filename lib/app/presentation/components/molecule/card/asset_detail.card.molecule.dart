import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/injector.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.state.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/config/config.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/components/atom/image/network_image.atom.dart';
import 'package:waddi_wallet_app/app/presentation/components/atom/text/price.text.atom.dart';
import 'package:waddi_wallet_app/app/presentation/components/molecule/chips/increase.chip.molecule.dart';
import 'package:waddi_wallet_app/core/constants/colors.constants.dart';
import 'package:waddi_wallet_app/core/extensions/localization.extension.dart';

class AssetDetailCardMolecule extends StatelessWidget {
  const AssetDetailCardMolecule({
    super.key,
    required this.coin,
    required this.onLikePressed,
  });

  final CoinEntity coin;
  final Function(bool liked) onLikePressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  NetworkImageAtom(
                    width: 30,
                    height: 30,
                    borderRadius: BorderRadius.circular(100),
                    url: coin.icon,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coin.name),
                      Text(
                        coin.symbol,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: ColorsConstants.textAlt,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  PriceTextAtom(
                    fontSize: 24,
                    price: coin.price,
                    format: context.read<ConfigBloc>().state.currency,
                  ),
                  Text(
                    context.l10n.price,
                    style: const TextStyle(
                      color: ColorsConstants.textAlt,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              context.l10n.history,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        context.l10n.oneHour,
                        style: const TextStyle(
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
                  ),
                  Column(
                    children: [
                      Text(
                        context.l10n.oneDay,
                        style: const TextStyle(
                          color: ColorsConstants.textAlt,
                        ),
                      ),
                      IncreaseChipMolecule(
                        normalColor: ColorsConstants.grey,
                        increaseColor: ColorsConstants.success,
                        decreaseColor: ColorsConstants.error,
                        data: double.parse(coin.priceChange1d.toString()),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        context.l10n.oneWeek,
                        style: const TextStyle(
                          color: ColorsConstants.textAlt,
                        ),
                      ),
                      IncreaseChipMolecule(
                        normalColor: ColorsConstants.grey,
                        increaseColor: ColorsConstants.success,
                        decreaseColor: ColorsConstants.error,
                        data: double.parse(coin.priceChange1w.toString()),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 50),
          BlocBuilder<AssetsBloc, AssetsState>(
            builder: (BuildContext context, AssetsState state) {
              return Visibility(
                visible: !coin.liked,
                replacement: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: injector
                        .get<ColorsConstants>()
                        .primary
                        .withOpacity(0.2),
                  ),
                  onPressed: () {
                    onLikePressed(
                      coin.liked,
                    );
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.l10n.removeFromFavorites),
                      const SizedBox(width: 20),
                      const Icon(
                        color: ColorsConstants.error,
                        Icons.favorite,
                      ),
                    ],
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ColorsConstants.success.withOpacity(0.4),
                  ),
                  onPressed: () {
                    onLikePressed(
                      coin.liked,
                    );
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.l10n.addToFavorites),
                      const SizedBox(width: 20),
                      const Icon(
                        color: ColorsConstants.error,
                        Icons.favorite_border_outlined,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
