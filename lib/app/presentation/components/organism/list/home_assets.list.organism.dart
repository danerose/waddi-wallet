import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, index) {
              return const AssetLoadingCardMolecule();
            },
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.list.length,
            itemBuilder: (BuildContext context, int i) {
              return AssetCardMolecule(coin: state.list[i]);
            },
          );
        }
      },
    );
  }
}
