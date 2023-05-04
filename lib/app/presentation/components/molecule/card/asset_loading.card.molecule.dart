import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';
import 'package:waddi_wallet_app/app/injector.dart';
import 'package:waddi_wallet_app/core/config/size/size.config.dart';

class AssetLoadingCardMolecule extends StatelessWidget {
  const AssetLoadingCardMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        child: Row(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: 34,
                height: 34,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 12,
                          width: injector.get<SizeConfig>().sizeHorizontal * 20,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 12,
                          width: injector.get<SizeConfig>().sizeHorizontal * 30,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 10,
                          width: injector.get<SizeConfig>().sizeHorizontal * 10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 10,
                          width: injector.get<SizeConfig>().sizeHorizontal * 10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  width: 30,
                  height: 30,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
