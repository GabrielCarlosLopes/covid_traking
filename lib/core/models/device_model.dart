import 'package:covid_traking/features/home/domain/entities/device_entity.dart';

class DeviceModel {
  final String? name;
  final String? brand;
  final String? type;
  final String? model;
  final String? version;
  final String? system;

  DeviceModel(
      {required this.name,
      required this.brand,
      required this.type,
      required this.model,
      required this.version,
      required this.system});

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      name: json['name'],
      brand: json['brand'],
      type: json['type'],
      model: json['model'],
      version: json['version'],
      system: json['system'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'brand': brand,
      'type': type,
      'model': model,
      'version': version,
      'system': system,
    };
  }

  DeviceEntity toEntity() {
    return DeviceEntity(
      name: name,
      brand: brand,
      type: type,
      model: model,
      version: version,
      system: system,
    );
  }

  factory DeviceModel.fromEntity(DeviceEntity entity) {
    return DeviceModel(
      name: entity.name,
      brand: entity.brand,
      type: entity.type,
      model: entity.model,
      version: entity.version,
      system: entity.system,
    );
  }
}
