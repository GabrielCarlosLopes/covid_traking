import 'package:covid_traking/core/core.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:covid_traking/features/home/domain/entities/device_entity.dart';
import 'package:covid_traking/features/home/domain/usecases/get_device_infos.dart';

class GetDeviceInformations implements GetDeviceInfos {
  final DeviceInfoPlugin deviceInfoPlugin;

  GetDeviceInformations(this.deviceInfoPlugin);

  @override
  Future<DeviceEntity> call({required bool isAndroid}) async {
    try {
      if (isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;

        return DeviceEntity(
          name: androidInfo.device,
          brand: androidInfo.brand,
          type: androidInfo.type,
          model: androidInfo.model,
          version: androidInfo.version.release,
          system: "Android",
        );
      } else {
        final iosInfo = await deviceInfoPlugin.iosInfo;

        return DeviceEntity(
          name: iosInfo.name,
          brand: "Apple",
          type: iosInfo.utsname.machine,
          model: iosInfo.model,
          version: iosInfo.systemVersion,
          system: iosInfo.utsname.sysname,
        );
      }
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
