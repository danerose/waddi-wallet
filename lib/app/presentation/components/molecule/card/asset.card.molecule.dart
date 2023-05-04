import 'package:flutter/material.dart';
import 'package:waddi_wallet_app/app/domain/entities/coin/coin.entity.dart';
import 'package:waddi_wallet_app/app/presentation/components/atom/image/network_image.atom.dart';
import 'package:waddi_wallet_app/app/presentation/components/molecule/chips/increase.chip.molecule.dart';
import 'package:waddi_wallet_app/core/constants/colors.constants.dart';

class AssetCardMolecule extends StatelessWidget {
  const AssetCardMolecule({super.key, required this.coin});

  final CoinEntity coin;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
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
                        Text(coin.price.toString()),
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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
