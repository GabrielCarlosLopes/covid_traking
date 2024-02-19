import 'package:covid_traking/features/login/presenter/controllers/login_store.dart';
import 'package:covid_traking/features/splash/data/usecases/usecases.dart';
import 'package:covid_traking/features/splash/presenter/controllers/splash_store.dart';
import 'package:covid_traking/infra/cache/local_storage_adapter.dart';
import 'package:covid_traking/infra/http/http_adapter.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

import '../features/login/data/usecases/auth/remote_authentication.dart';

final di = GetIt.I;
Future<void> initializeDependencies() async {
  //adapters
  di.registerSingleton<HttpAdapter>(HttpAdapter(Client()));
  final localStorage = LocalStorage('covid_traking');
  di.registerSingleton<LocalStorage>(localStorage);
  di.registerSingleton<LocalStorageAdapter>(
      LocalStorageAdapter(localStorage: di<LocalStorage>()));

  //usecases
  di.registerSingleton(
      LocalCheckUserLoggedIn(cacheStorage: di<LocalStorageAdapter>()));

  di.registerSingleton(RemoteAuthentication());

  //controllers

  di.registerSingleton(
      SplashStore(localCheckUserLoggedIn: di<LocalCheckUserLoggedIn>()));

  di.registerSingleton(LoginStore(
      remoteAuthentication: di<RemoteAuthentication>(),
      localStorageAdapter: di<LocalStorageAdapter>()));
}
