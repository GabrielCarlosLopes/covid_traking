import 'package:covid_traking/core/models/models.dart';
import 'package:covid_traking/features/login/data/usecases/auth/remote_authentication.dart';
import 'package:covid_traking/features/login/domain/entities/user_entity.dart';
import 'package:covid_traking/features/login/domain/usecases/authentication.dart';
import 'package:covid_traking/features/login/presenter/controllers/controllers.dart';
import 'package:covid_traking/infra/cache/cache.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/mocks/params_factory.dart';

class MockRemoteAuthentication extends Mock implements RemoteAuthentication {}

class MockLocalStorageAdapter extends Mock implements LocalStorageAdapter {}

void main() {
  late LoginStore loginStore;
  late MockRemoteAuthentication mockRemoteAuthentication;
  late MockLocalStorageAdapter mockLocalStorageAdapter;
  late AuthenticationParams params;
  late UserEntity user;

  UserEntity makeUserEntity(AuthenticationParams param) => user = UserModel(
        documentType: param.documentType,
        documentNumber: param.documentNumber,
        password: param.password,
      ).toEntity();

  setUp(() {
    params = ParamsFactory.makeAuthentication();
    mockRemoteAuthentication = MockRemoteAuthentication();
    mockLocalStorageAdapter = MockLocalStorageAdapter();
    user = makeUserEntity(params);
    loginStore = LoginStore(
      remoteAuthentication: mockRemoteAuthentication,
      localStorageAdapter: mockLocalStorageAdapter,
    );
  });

  test('Initial values are correct', () {
    expect(loginStore.isLoading, false);
    expect(loginStore.isPasswordVisible, true);
    expect(loginStore.documentType, '');
    expect(loginStore.documentNumber, '');
    expect(loginStore.password, '');
    expect(loginStore.error, '');
    expect(loginStore.redirect, null);
  });

  test('Redirect is valid', () {
    loginStore.setRedirect('/home');
    expect(loginStore.redirectIsValid, true);
  });

  test('Form is valid', () {
    loginStore.setDocumentType('docType');
    loginStore.setDocumentNumber('docNumber');
    loginStore.setPassword('password');
    expect(loginStore.isFormValid, true);
  });

  test('Form is invalid when one field is empty', () {
    loginStore.setDocumentType('docType');
    loginStore.setDocumentNumber('');
    loginStore.setPassword('password');
    expect(loginStore.isFormValid, false);
  });

  test('Change password visibility toggles visibility', () {
    final initialValue = loginStore.isPasswordVisible;
    loginStore.changePasswordVisibility();
    expect(loginStore.isPasswordVisible, !initialValue);
  });

  test('Setting redirect updates redirectIsValid', () {
    expect(loginStore.redirectIsValid, false);
    loginStore.setRedirect('/home');
    expect(loginStore.redirectIsValid, true);
  });

  test('Setting error updates hasError', () {
    expect(loginStore.hasError, false);
    loginStore.setError('Error message');
    expect(loginStore.hasError, true);
  });

  test('Setting document type updates documentType', () {
    const documentType = 'documentType';
    loginStore.setDocumentType(documentType);
    expect(loginStore.documentType, documentType);
  });

  test('Setting document number updates documentNumber', () {
    const documentNumber = 'documentNumber';
    loginStore.setDocumentNumber(documentNumber);
    expect(loginStore.documentNumber, documentNumber);
  });

  test('Setting password updates password', () {
    const password = 'password';
    loginStore.setPassword(password);
    expect(loginStore.password, password);
  });

  test('Login sets isLoading to false after completing', () async {
    when(() => mockRemoteAuthentication.auth(params))
        .thenAnswer((_) async => user);

    await loginStore.login();
    expect(loginStore.isLoading, false);
  });

  test('Login sets redirect path to /home after successful authentication',
      () async {
    loginStore.setDocumentType(params.documentType);
    loginStore.setDocumentNumber(params.documentNumber);
    loginStore.setPassword(params.password);

    when(() => mockLocalStorageAdapter.save(key: 'logged', value: true))
        .thenAnswer((_) async => true);

    when(() => mockRemoteAuthentication.auth(params))
        .thenAnswer((_) async => user);

    await loginStore.login();

    expect(loginStore.redirect, '/home');
  });

  test(
      'Login sets error message when authentication fails with unexpected error',
      () async {
    when(() => mockRemoteAuthentication.auth(params)).thenThrow(Exception());
    await loginStore.login();
    expect(
        loginStore.error, 'Algo errado aconteceu. Tente novamente em breve.');
  });
}
