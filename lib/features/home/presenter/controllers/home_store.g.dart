// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: 'HomeStoreBase.hasError'))
      .value;
  Computed<bool>? _$redirectIsValidComputed;

  @override
  bool get redirectIsValid =>
      (_$redirectIsValidComputed ??= Computed<bool>(() => super.redirectIsValid,
              name: 'HomeStoreBase.redirectIsValid'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

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

  late final _$redirectAtom =
      Atom(name: 'HomeStoreBase.redirect', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: 'HomeStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$deviceModelAtom =
      Atom(name: 'HomeStoreBase.deviceModel', context: context);

  @override
  DeviceModel? get deviceModel {
    _$deviceModelAtom.reportRead();
    return super.deviceModel;
  }

  @override
  set deviceModel(DeviceModel? value) {
    _$deviceModelAtom.reportWrite(value, super.deviceModel, () {
      super.deviceModel = value;
    });
  }

  late final _$covidInfosModelAtom =
      Atom(name: 'HomeStoreBase.covidInfosModel', context: context);

  @override
  CovidInfosModel? get covidInfosModel {
    _$covidInfosModelAtom.reportRead();
    return super.covidInfosModel;
  }

  @override
  set covidInfosModel(CovidInfosModel? value) {
    _$covidInfosModelAtom.reportWrite(value, super.covidInfosModel, () {
      super.covidInfosModel = value;
    });
  }

  late final _$getDeviceInformationsDataAsyncAction =
      AsyncAction('HomeStoreBase.getDeviceInformationsData', context: context);

  @override
  Future<void> getDeviceInformationsData(bool isAndroid) {
    return _$getDeviceInformationsDataAsyncAction
        .run(() => super.getDeviceInformationsData(isAndroid));
  }

  late final _$getCurrentCovidInfosAsyncAction =
      AsyncAction('HomeStoreBase.getCurrentCovidInfos', context: context);

  @override
  Future<void> getCurrentCovidInfos() {
    return _$getCurrentCovidInfosAsyncAction
        .run(() => super.getCurrentCovidInfos());
  }

  late final _$saveUserLoggedAsyncAction =
      AsyncAction('HomeStoreBase.saveUserLogged', context: context);

  @override
  Future<void> saveUserLogged() {
    return _$saveUserLoggedAsyncAction.run(() => super.saveUserLogged());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setError(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<DateTime> currentTimeStream() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.currentTimeStream');
    try {
      return super.currentTimeStream();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
redirect: ${redirect},
errorMessage: ${errorMessage},
deviceModel: ${deviceModel},
covidInfosModel: ${covidInfosModel},
hasError: ${hasError},
redirectIsValid: ${redirectIsValid}
    ''';
  }
}
