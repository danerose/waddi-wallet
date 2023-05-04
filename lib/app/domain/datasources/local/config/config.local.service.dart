import 'package:waddi_wallet_app/app/data/db/config/config.dao.dart';

abstract class ConfigLocalService {
  Future<void> deleteLocalConfig();
  Future<void> setLocalConfig(ConfigDao config);
  Future<ConfigDao> getLocalConfig();
}
