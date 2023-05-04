import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waddi_wallet_app/app/injector.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.event.dart';
import 'package:waddi_wallet_app/core/config/size/size.config.dart';
import 'package:waddi_wallet_app/core/constants/colors.constants.dart';
import 'package:waddi_wallet_app/core/enum/assets_filters.enum.dart';
import 'package:waddi_wallet_app/core/extensions/localization.extension.dart';

import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.bloc.dart';
import 'package:waddi_wallet_app/app/presentation/bloc/coins/filters/filter_assets.state.dart';

class FiltersAssetCardMolecule extends StatelessWidget {
  const FiltersAssetCardMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<FilterAssetsBloc, FilterAssetsState>(
        buildWhen: (p, c) => p.filter != c.filter,
        builder: (BuildContext context, FilterAssetsState state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.l10n.filters),
                  TextButton(
                    onPressed: () {
                      context
                          .read<FilterAssetsBloc>()
                          .add(const FilterAssetsEventSetFilter(
                            filter: AssetsFilterEnum.none,
                          ));
                    },
                    child: Text(context.l10n.reset),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                context.l10n.sortByAlphabeticalOrder,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      context
                          .read<FilterAssetsBloc>()
                          .add(const FilterAssetsEventSetFilter(
                            filter: AssetsFilterEnum.toAtoZ,
                          ));
                    },
                    child: Text(
                      '${context.l10n.fromA} ${context.l10n.toZ}',
                      style: TextStyle(
                        color: state.filter == AssetsFilterEnum.toAtoZ
                            ? ColorsConstants.warning
                            : null,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<FilterAssetsBloc>()
                          .add(const FilterAssetsEventSetFilter(
                            filter: AssetsFilterEnum.toZtoA,
                          ));
                    },
                    child: Text(
                      '${context.l10n.fromZ} ${context.l10n.toA}',
                      style: TextStyle(
                        color: state.filter == AssetsFilterEnum.toZtoA
                            ? ColorsConstants.warning
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                context.l10n.sortByPrices,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<FilterAssetsBloc>().add(
                          const FilterAssetsEventSetFilter(
                              filter: AssetsFilterEnum.toLowerPtoHigherP));
                    },
                    child: Text(
                      '${context.l10n.fromLowestPrice} ${context.l10n.toHighestPrice}',
                      style: TextStyle(
                        color:
                            state.filter == AssetsFilterEnum.toLowerPtoHigherP
                                ? ColorsConstants.warning
                                : null,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      context
                          .read<FilterAssetsBloc>()
                          .add(const FilterAssetsEventSetFilter(
                            filter: AssetsFilterEnum.toHigherPtoLowerP,
                          ));
                    },
                    child: Text(
                      '${context.l10n.fromHighestPrice} ${context.l10n.toLowestPrice}',
                      style: TextStyle(
                        color:
                            state.filter == AssetsFilterEnum.toHigherPtoLowerP
                                ? ColorsConstants.warning
                                : null,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: injector.get<SizeConfig>().sizeHorizontal * 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: injector.get<ColorsConstants>().primary,
                    foregroundColor: ColorsConstants.white,
                  ),
                  onPressed: () async {
                    Navigator.pop(context, state.filter);
                  },
                  child: Text(context.l10n.filter),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
