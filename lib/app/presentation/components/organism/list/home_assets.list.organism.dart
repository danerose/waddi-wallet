import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.event.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.state.dart';
import 'package:waddi_wallet_app/app/presentation/components/molecule/card/filters_assets.card.molecule.dart';
import 'package:waddi_wallet_app/core/enum/assets_filters.enum.dart';

import 'package:waddi_wallet_app/core/extensions/localization.extension.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/assets/assets.state.dart';

import 'package:waddi_wallet_app/app/presentation/components/molecule/card/asset.card.molecule.dart';
import 'package:waddi_wallet_app/app/presentation/components/molecule/card/asset_loading.card.molecule.dart';

class HomeAssetsListsOrganism extends StatelessWidget {
  const HomeAssetsListsOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetsBloc, AssetsState>(
      builder: (BuildContext context, AssetsState state) {
        if (state.loading) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.assets),
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.filter_list_sharp),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const AssetLoadingCardMolecule();
                },
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.assets),
                    IconButton(
                      onPressed: () async {
                        await showModalBottomSheet<AssetsFilterEnum>(
                          context: context,
                          builder: (BuildContext context) {
                            return const FiltersAssetCardMolecule();
                          },
                        ).then((f) {
                          if (f != null && f != AssetsFilterEnum.none) {
                            context.read<FilterAssetsBloc>().add(
                                  FilterAssetsEventSort(
                                    filter: f,
                                    list: state.coins,
                                  ),
                                );
                          }
                        });
                      },
                      icon: const Icon(Icons.filter_list_sharp),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !context.watch<FilterAssetsBloc>().state.showFilteredL,
                replacement: BlocBuilder<FilterAssetsBloc, FilterAssetsState>(
                  builder: (BuildContext context, FilterAssetsState filter) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filter.filteredList.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Visibility(
                          visible: !filter.filteredList[i].liked,
                          child: AssetCardMolecule(
                            coin: filter.filteredList[i],
                            onCardPressed: () {},
                            onLikePressed: (bool liked) {
                              if (state.favs.length >= 4) {
                              } else {
                                if (liked) {
                                  context.read<AssetsBloc>().add(
                                        AssestEventRemoveFromFav(
                                          id: filter.filteredList[i].id,
                                          index: i,
                                        ),
                                      );
                                } else {
                                  context.read<AssetsBloc>().add(
                                        AssestEventAddToFav(
                                          id: filter.filteredList[i].id,
                                          index: i,
                                        ),
                                      );
                                }
                              }
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.coins.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Visibility(
                      visible: !state.coins[i].liked,
                      child: AssetCardMolecule(
                        coin: state.coins[i],
                        onCardPressed: () {},
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
                      ),
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
