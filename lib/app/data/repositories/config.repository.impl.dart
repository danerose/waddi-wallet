import 'package:waddi_wallet_app/app/data/db/config/config.dao.dart';
import 'package:waddi_wallet_app/app/domain/datasources/local/config/config.local.service.dart';
import 'package:waddi_wallet_app/app/domain/entities/config/config.entity.dart';
import 'package:waddi_wallet_app/app/domain/repositories/config.repository.dart';

class ConfigRepositoryImpl implements ConfigRepository {
  final ConfigLocalService configLocalService;

  const ConfigRepositoryImpl({required this.configLocalService});

  @override
  Future<void> deleteLocalConfig() async {
    await configLocalService.deleteLocalConfig();
  }

  @override
  Future<ConfigEntity> getLocalConfig() async {
    final res = await configLocalService.getLocalConfig();
    return ConfigEntity.fromDao(res);
  }

  @override
  Future<void> setLocalConfig(ConfigEntity config) async {
    await configLocalService.setLocalConfig(
      ConfigDao(theme: config.theme, currency: config.currency),
    );
  }
}
