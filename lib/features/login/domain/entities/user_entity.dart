import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String documentType;
  final String documentNumber;
  final String password;

  const UserEntity(
      {required this.documentType,
      required this.documentNumber,
      required this.password});

  @override
  List get props => [documentType, documentNumber, password];
}
