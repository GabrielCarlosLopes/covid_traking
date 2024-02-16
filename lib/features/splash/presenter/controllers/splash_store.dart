import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../data/usecases/usecases.dart';
part 'splash_store.g.dart';

class SplashStore = SplashStoreBase with _$SplashStore;

abstract class SplashStoreBase with Store {
  final LocalCheckUserLoggedIn localCheckUserLoggedIn;

  SplashStoreBase({required this.localCheckUserLoggedIn});

  @observable
  bool isLoading = false;

  @observable
  String? redirect;

  @observable
  String? error;

  @observable
  int progress = 0;

  @computed
  bool get getIsLoading => isLoading;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> checkUserLoggedIn() async {
    setLoading(true);
    try {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (progress < 100) progress += 1;
        if (progress == 100) {
          timer.cancel();
        }
      });
      await Future.delayed(const Duration(seconds: 2));
      final userLogged = await localCheckUserLoggedIn.call();

      if (userLogged) {
        redirect = '/home';
      } else {
        redirect = '/login';
      }
    } catch (e) {
      redirect = '/login';
    } finally {
      progress = 100;
      setLoading(false);
    }
  }
}
