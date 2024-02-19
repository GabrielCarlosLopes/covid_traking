import 'package:covid_traking/core/core.dart';
import 'package:covid_traking/core/models/models.dart';
import 'package:covid_traking/features/login/data/usecases/auth/remote_authentication.dart';
import 'package:covid_traking/features/login/domain/usecases/authentication.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../domain/mocks/params_factory.dart';

class MockAuthenticationParams extends Mock implements AuthenticationParams {}

class MockRootBundle extends Mock implements AssetBundle {}

void main() {
  late RemoteAuthentication remoteAuthentication;
  late AuthenticationParams mockParams;
  late MockRootBundle mockRootBundle;

  setUp(() {
    remoteAuthentication = RemoteAuthentication();
    mockParams = ParamsFactory.makeAuthentication();
    mockRootBundle = MockRootBundle();
  });
  test('should throw an UnexpectedError if an error occurs', () async {
    when(() => mockRootBundle.load(any())).thenThrow(Exception());

    final future = remoteAuthentication.auth(mockParams);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('should return a user entity if authentication is successful', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final userEntity = UserModel(
      documentType: mockParams.documentType.toLowerCase(),
      documentNumber: mockParams.documentNumber.toLowerCase(),
      password: mockParams.password,
    ).toEntity();

    final result = await remoteAuthentication.auth(mockParams);

    expect(result, equals(userEntity));
  });

  test('should throw an InvalidCredentialsError if authentication fails',
      () async {
    final future =
        remoteAuthentication.auth(ParamsFactory.makeInvalidAuthentication());

    // Assert
    expect(future, throwsA(DomainError.invalidCredentials));
  });
}
