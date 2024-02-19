// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  Computed<bool>? _$redirectIsValidComputed;

  @override
  bool get redirectIsValid =>
      (_$redirectIsValidComputed ??= Computed<bool>(() => super.redirectIsValid,
              name: 'LoginStoreBase.redirectIsValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'LoginStoreBase.isFormValid'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: 'LoginStoreBase.hasError'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: 'LoginStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isPasswordVisibleAtom =
      Atom(name: 'LoginStoreBase.isPasswordVisible', context: context);

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$documentTypeAtom =
      Atom(name: 'LoginStoreBase.documentType', context: context);

  @override
  String get documentType {
    _$documentTypeAtom.reportRead();
    return super.documentType;
  }

  @override
  set documentType(String value) {
    _$documentTypeAtom.reportWrite(value, super.documentType, () {
      super.documentType = value;
    });
  }

  late final _$documentNumberAtom =
      Atom(name: 'LoginStoreBase.documentNumber', context: context);

  @override
  String get documentNumber {
    _$documentNumberAtom.reportRead();
    return super.documentNumber;
  }

  @override
  set documentNumber(String value) {
    _$documentNumberAtom.reportWrite(value, super.documentNumber, () {
      super.documentNumber = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'LoginStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$errorAtom = Atom(name: 'LoginStoreBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$redirectAtom =
      Atom(name: 'LoginStoreBase.redirect', context: context);

  @override
  String? get redirect {
    _$redirectAtom.reportRead();
    return super.redirect;
  }

  @override
  set redirect(String? value) {
    _$redirectAtom.reportWrite(value, super.redirect, () {
      super.redirect = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginStoreBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  void setRedirect(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setRedirect');
    try {
      return super.setRedirect(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordVisibility() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDocumentType(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setDocumentType');
    try {
      return super.setDocumentType(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDocumentNumber(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setDocumentNumber');
    try {
      return super.setDocumentNumber(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isPasswordVisible: ${isPasswordVisible},
documentType: ${documentType},
documentNumber: ${documentNumber},
password: ${password},
error: ${error},
redirect: ${redirect},
redirectIsValid: ${redirectIsValid},
isFormValid: ${isFormValid},
hasError: ${hasError}
    ''';
  }
}
