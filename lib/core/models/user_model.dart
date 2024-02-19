import 'package:covid_traking/features/login/domain/entities/user_entity.dart';

class UserModel {
  final String documentType;
  final String documentNumber;
  final String password;

  UserModel(
      {required this.documentType,
      required this.documentNumber,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      'document-type': documentType,
      'document-number': documentNumber,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      documentType: json['document-type'],
      documentNumber: json['document-number'],
      password: json['password'],
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      documentType: documentType,
      documentNumber: documentNumber,
      password: password,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      documentType: entity.documentType,
      documentNumber: entity.documentNumber,
      password: entity.password,
    );
  }
}
