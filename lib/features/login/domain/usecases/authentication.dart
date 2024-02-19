import 'package:equatable/equatable.dart';

import '../entities/user_entity.dart';

abstract class Authentication {
  Future<UserEntity> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String documentType;
  final String documentNumber;
  final String password;

  const AuthenticationParams(
      {required this.documentType,
      required this.documentNumber,
      required this.password});

  @override
  List get props => [documentType, documentNumber, password];
}
