import 'package:waddi_wallet_app/app/domain/entities/config/config.entity.dart';
import 'package:waddi_wallet_app/app/domain/repositories/config.repository.dart';

class GetConfigUsecase {
  final ConfigRepository configRepository;
  const GetConfigUsecase({required this.configRepository});

  Future<ConfigEntity> execute() async {
    return await configRepository.getLocalConfig();
  }
}
