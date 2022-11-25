// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrefsController on _PrefsControllerBase, Store {
  late final _$savedEventListAtom =
      Atom(name: '_PrefsControllerBase.savedEventList', context: context);

  @override
  List<EventModel> get savedEventList {
    _$savedEventListAtom.reportRead();
    return super.savedEventList;
  }

  @override
  set savedEventList(List<EventModel> value) {
    _$savedEventListAtom.reportWrite(value, super.savedEventList, () {
      super.savedEventList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PrefsControllerBase.isLoading', context: context);

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

  late final _$isErrorAtom =
      Atom(name: '_PrefsControllerBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$getSavedEventListAsyncAction =
      AsyncAction('_PrefsControllerBase.getSavedEventList', context: context);

  @override
  Future<void> getSavedEventList() {
    return _$getSavedEventListAsyncAction.run(() => super.getSavedEventList());
  }

  late final _$_PrefsControllerBaseActionController =
      ActionController(name: '_PrefsControllerBase', context: context);

  @override
  void addToSavedList(EventModel eventModel) {
    final _$actionInfo = _$_PrefsControllerBaseActionController.startAction(
        name: '_PrefsControllerBase.addToSavedList');
    try {
      return super.addToSavedList(eventModel);
    } finally {
      _$_PrefsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromSavedList(EventModel eventModel) {
    final _$actionInfo = _$_PrefsControllerBaseActionController.startAction(
        name: '_PrefsControllerBase.removeFromSavedList');
    try {
      return super.removeFromSavedList(eventModel);
    } finally {
      _$_PrefsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_PrefsControllerBaseActionController.startAction(
        name: '_PrefsControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_PrefsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_PrefsControllerBaseActionController.startAction(
        name: '_PrefsControllerBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_PrefsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initLoading() {
    final _$actionInfo = _$_PrefsControllerBaseActionController.startAction(
        name: '_PrefsControllerBase.initLoading');
    try {
      return super.initLoading();
    } finally {
      _$_PrefsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void endLoading() {
    final _$actionInfo = _$_PrefsControllerBaseActionController.startAction(
        name: '_PrefsControllerBase.endLoading');
    try {
      return super.endLoading();
    } finally {
      _$_PrefsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
savedEventList: ${savedEventList},
isLoading: ${isLoading},
isError: ${isError}
    ''';
  }
}
