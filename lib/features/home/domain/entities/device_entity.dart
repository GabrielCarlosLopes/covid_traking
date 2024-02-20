import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  final String? name;
  final String? brand;
  final String? type;
  final String? model;
  final String? version;
  final String? system;

  const DeviceEntity(
      {required this.name,
      required this.brand,
      required this.type,
      required this.model,
      required this.version,
      required this.system});

  @override
  List get props => [name, brand, type, model, version, system];
}
