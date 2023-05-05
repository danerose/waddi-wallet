import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/app/presentation/components/molecule/card/asset_detail.card.molecule.dart';

import 'package:waddi_wallet_app/core/extensions/localization.extension.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.state.dart';

import 'package:waddi_wallet_app/app/presentation/components/molecule/card/fav_asset.card.molecule.dart';

class HomeFavAssetsListOrganism extends StatelessWidget {
  const HomeFavAssetsListOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetsBloc, AssetsState>(
      buildWhen: (p, c) => p.favs.length != c.favs.length,
      builder: (BuildContext context, AssetsState state) {
        if (state.favs.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.favorites),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  state.favs.length,
                  (i) {
                    return FavcAssetCardMolecule(
                      coin: state.favs[i],
                      onFavPressed: () async {
                        await showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AssetDetailCardMolecule(
                              coin: state.favs[i],
                              onLikePressed: (bool liked) {
                                if (state.favs.length >= 4) {
                                } else {
                                  if (liked) {
                                    context.read<AssetsBloc>().add(
                                          AssestEventRemoveFromFav(
                                            id: state.coins[i].id,
                                            index: i,
                                          ),
                                        );
                                  } else {
                                    context.read<AssetsBloc>().add(
                                          AssestEventAddToFav(
                                            id: state.coins[i].id,
                                            index: i,
                                          ),
                                        );
                                  }
                                }
                              },
                            );
                          },
                        );
                      },
                      onLikePressed: (bool liked) {
                        if (liked) {
                          context.read<AssetsBloc>().add(
                                AssestEventRemoveFromFav(
                                  id: state.favs[i].id,
                                  index: i,
                                ),
                              );
                        } else {
                          context.read<AssetsBloc>().add(
                                AssestEventAddToFav(
                                  id: state.favs[i].id,
                                  index: i,
                                ),
                              );
                        }
                      },
                    );
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }
}
