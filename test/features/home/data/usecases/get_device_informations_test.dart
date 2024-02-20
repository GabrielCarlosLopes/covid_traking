import 'package:covid_traking/core/core.dart';
import 'package:covid_traking/features/home/data/usecases/get_device_informations.dart';
import 'package:covid_traking/features/home/domain/entities/device_entity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceInfoPlugin extends Mock implements DeviceInfoPlugin {}

void main() {
  late GetDeviceInformations usecase;
  late MockDeviceInfoPlugin mockDeviceInfoPlugin;

  setUp(() {
    mockDeviceInfoPlugin = MockDeviceInfoPlugin();
    usecase = GetDeviceInformations(mockDeviceInfoPlugin);
  });

  test('Should return DeviceEntity for Android', () async {
    // Arrange
    final androidInfo = AndroidDeviceInfo.fromMap({
      'data': 'map',
      'version': {
        'baseOS': 'baseOS',
        'codename': 'codename',
        'incremental': 'incremental',
        'previewSdkInt': 0,
        'release': 'release',
        'sdkInt': 0,
        'securityPatch': 'securityPatch',
      },
      'board': '',
      'bootloader': '',
      'brand': 'brand',
      'device': 'name',
      'display': '',
      'fingerprint': '',
      'hardware': '',
      'host': '',
      'id': '',
      'manufacturer': '',
      'model': 'model',
      'product': '',
      'supported32BitAbis': [],
      'supported64BitAbis': [],
      'supportedAbis': [],
      'tags': '',
      'type': 'type',
      'isPhysicalDevice': false,
      'systemFeatures': [],
      'displayMetrics': {
        'widthPx': 0.0,
        'heightPx': 0.0,
        'xDpi': 0.0,
        'yDpi': 0.0,
      },
      'serialNumber': '',
    });

    when(() => mockDeviceInfoPlugin.androidInfo)
        .thenAnswer((_) async => androidInfo);

    // Act
    final result = await usecase.call(isAndroid: true);

    // Assert
    expect(
        result,
        const DeviceEntity(
          name: 'name',
          brand: 'brand',
          type: 'type',
          model: 'model',
          version: 'release',
          system: 'Android',
        ));
  });

  test('Should return DeviceEntity for iOS', () async {
    // Arrange
    final iosInfo = IosDeviceInfo.fromMap({
      'data': {},
      'name': 'name',
      'systemName': 'systemName',
      'systemVersion': 'systemVersion',
      'model': 'model',
      'localizedModel': 'localizedModel',
      'identifierForVendor': 'identifierForVendor',
      'isPhysicalDevice': true,
      'utsname': {
        'sysname': 'sysname',
        'nodename': 'nodename',
        'release': 'release',
        'version': 'version',
        'machine': 'machine',
      },
    });
    when(() => mockDeviceInfoPlugin.iosInfo).thenAnswer((_) async => iosInfo);

    // Act
    final result = await usecase.call(isAndroid: false);

    // Assert
    expect(
        result,
        const DeviceEntity(
          name: 'name',
          brand: 'Apple',
          type: 'machine',
          model: 'model',
          version: 'systemVersion',
          system: 'sysname',
        ));
  });

  test('Should throw unexpected error if Android throws', () async {
    // Arrange
    when(() => mockDeviceInfoPlugin.androidInfo)
        .thenThrow(DomainError.unexpected);

    // Act
    final result = usecase.call(isAndroid: true);

    // Assert
    expect(result, throwsA(DomainError.unexpected));
  });
}
