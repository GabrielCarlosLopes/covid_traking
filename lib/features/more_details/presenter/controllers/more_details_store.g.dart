// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoreDetailsStore on MoreDetailsStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MoreDetailsStoreBase.isLoading', context: context);

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

  late final _$statesAtom =
      Atom(name: 'MoreDetailsStoreBase.states', context: context);

  @override
  ObservableList<StateModel>? get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(ObservableList<StateModel>? value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'MoreDetailsStoreBase.error', context: context);

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

  late final _$getListAsyncAction =
      AsyncAction('MoreDetailsStoreBase.getList', context: context);

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  late final _$MoreDetailsStoreBaseActionController =
      ActionController(name: 'MoreDetailsStoreBase', context: context);

  @override
  void setError(String value) {
    final _$actionInfo = _$MoreDetailsStoreBaseActionController.startAction(
        name: 'MoreDetailsStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$MoreDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
states: ${states},
error: ${error}
    ''';
  }
}
