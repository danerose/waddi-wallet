import 'package:waddi_wallet_app/app/domain/entities/config/config.entity.dart';

abstract class ConfigRepository {
  Future<void> deleteLocalConfig();
  Future<void> setLocalConfig(ConfigEntity config);
  Future<ConfigEntity> getLocalConfig();
  // Future<>
}
