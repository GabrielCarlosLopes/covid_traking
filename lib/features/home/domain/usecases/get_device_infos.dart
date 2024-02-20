import 'package:covid_traking/features/home/domain/entities/device_entity.dart';

abstract class GetDeviceInfos {
  Future<DeviceEntity> call({required bool isAndroid});
}
