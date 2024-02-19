import 'dart:convert';

import 'package:covid_traking/features/login/domain/entities/user_entity.dart';

import '../../../../../core/core.dart';
import '../../../../../core/models/models.dart';
import '../../../domain/usecases/authentication.dart';

class RemoteAuthentication implements Authentication {
  @override
  Future<UserEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();

    try {
      final json = await loadJson('lib/core/constants/user.json');
      dynamic response;
      await Future.delayed(const Duration(seconds: 2))
          .then((_) async => response = jsonEncode(json));

      if (response == null) {
        throw DomainError.invalidCredentials;
      } else {
        final user = UserModel.fromJson(jsonDecode(response!)).toEntity();

        if (user.documentNumber != body['document-number'] ||
            user.password != body['password'] ||
            user.documentType != body['document-type']) {
          throw DomainError.invalidCredentials;
        } else {
          return user;
        }
      }
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String documentType;
  final String documentNumber;
  final String password;

  RemoteAuthenticationParams({
    required this.documentType,
    required this.documentNumber,
    required this.password,
  });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams entity) {
    return RemoteAuthenticationParams(
      documentType: entity.documentType,
      documentNumber: entity.documentNumber,
      password: entity.password,
    );
  }

  Map toJson() {
    return {
      'document-type': documentType,
      'document-number': documentNumber,
      'password': password,
    };
  }
}
