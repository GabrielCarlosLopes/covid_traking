// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashStore on SplashStoreBase, Store {
  Computed<bool>? _$getIsLoadingComputed;

  @override
  bool get getIsLoading =>
      (_$getIsLoadingComputed ??= Computed<bool>(() => super.getIsLoading,
              name: 'SplashStoreBase.getIsLoading'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'SplashStoreBase.isLoading', context: context);

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
      Atom(name: 'SplashStoreBase.redirect', context: context);

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

  late final _$errorAtom =
      Atom(name: 'SplashStoreBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$progressAtom =
      Atom(name: 'SplashStoreBase.progress', context: context);

  @override
  int get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(int value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  late final _$checkUserLoggedInAsyncAction =
      AsyncAction('SplashStoreBase.checkUserLoggedIn', context: context);

  @override
  Future<void> checkUserLoggedIn() {
    return _$checkUserLoggedInAsyncAction.run(() => super.checkUserLoggedIn());
  }

  late final _$SplashStoreBaseActionController =
      ActionController(name: 'SplashStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$SplashStoreBaseActionController.startAction(
        name: 'SplashStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$SplashStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
redirect: ${redirect},
error: ${error},
progress: ${progress},
getIsLoading: ${getIsLoading}
    ''';
  }
}
