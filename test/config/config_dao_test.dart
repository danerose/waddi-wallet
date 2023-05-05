import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waddi_wallet_app/app/data/db/config/config.dao.dart';
import 'package:waddi_wallet_app/app/domain/entities/config/config.entity.dart';

void main() {
  const configDao = ConfigDao(
    theme: ThemeMode.system,
    currency: 'USD',
  );

  const configEntity = ConfigEntity(theme: ThemeMode.system, currency: 'USD');

  group('from Dao', () {
    test(
      'should be a subclass of config entity',
      () async {
        // assert
        final result = ConfigEntity.fromDao(configDao);
        expect(result, equals(configEntity));
      },
    );
  });
}
