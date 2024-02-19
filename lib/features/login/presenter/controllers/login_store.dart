import 'package:mobx/mobx.dart';

import 'package:covid_traking/core/core.dart';
import 'package:covid_traking/features/login/data/usecases/auth/remote_authentication.dart';
import 'package:covid_traking/features/login/domain/usecases/authentication.dart';
import 'package:covid_traking/infra/infra.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final RemoteAuthentication remoteAuthentication;
  final LocalStorageAdapter localStorageAdapter;

  LoginStoreBase({
    required this.remoteAuthentication,
    required this.localStorageAdapter,
  });

  @observable
  bool isLoading = false;

  @observable
  bool isPasswordVisible = true;

  @observable
  String documentType = '';

  @observable
  String documentNumber = '';

  @observable
  String password = '';

  @observable
  String error = '';

  @observable
  String? redirect;

  @computed
  bool get redirectIsValid => redirect != null && redirect!.isNotEmpty;

  @computed
  bool get isFormValid =>
      documentType.isNotEmpty &&
      documentNumber.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get hasError => error.isNotEmpty;

  @action
  void setRedirect(String value) => redirect = value;

  @action
  void setError(String value) => error = value;

  @action
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void setDocumentType(String value) => documentType = value;

  @action
  void setDocumentNumber(String value) => documentNumber = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<void> login() async {
    isLoading = true;
    try {
      await remoteAuthentication.auth(
        AuthenticationParams(
          documentType: documentType.toLowerCase(),
          documentNumber: documentNumber.toLowerCase(),
          password: password,
        ),
      );

      await localStorageAdapter.save(
        key: 'logged',
        value: true,
      );

      setRedirect('/home');
    } catch (error) {
      if (error == DomainError.invalidCredentials) {
        setError('Credenciais inválidas');
      } else {
        setError('Algo errado aconteceu. Tente novamente em breve.');
      }
    } finally {
      isLoading = false;
    }
  }
}
