import 'package:covid_traking/core/constants/api_endpoints.dart';
import 'package:covid_traking/features/home/data/usecases/get_device_informations.dart';
import 'package:covid_traking/features/home/data/usecases/remote_get_current_covid_infos.dart';
import 'package:covid_traking/features/home/presenter/controllers/home_store.dart';
import 'package:covid_traking/features/login/presenter/controllers/login_store.dart';
import 'package:covid_traking/features/more_details/data/usecases/remote_get_list_current.dart';
import 'package:covid_traking/features/more_details/data/usecases/remote_get_list_info.dart';
import 'package:covid_traking/features/more_details/presenter/controllers/controllers.dart';
import 'package:covid_traking/features/splash/data/usecases/usecases.dart';
import 'package:covid_traking/features/splash/presenter/controllers/splash_store.dart';
import 'package:covid_traking/infra/cache/local_storage_adapter.dart';
import 'package:covid_traking/infra/http/http_adapter.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

import '../features/login/data/usecases/auth/remote_authentication.dart';

final ValueNotifier<ThemeMode> themeProvider = ValueNotifier(ThemeMode.light);

final di = GetIt.I;
Future<void> initializeDependencies() async {
  di.registerSingleton<ValueNotifier<ThemeMode>>(themeProvider);

  di.registerSingleton<Client>(Client());

  //adapters
  di.registerSingleton<HttpAdapter>(HttpAdapter(di<Client>()));
  final localStorage = LocalStorage('covid_traking');
  di.registerSingleton<LocalStorage>(localStorage);
  di.registerSingleton<LocalStorageAdapter>(
      LocalStorageAdapter(localStorage: di<LocalStorage>()));
  di.registerSingleton<DeviceInfoPlugin>(DeviceInfoPlugin());

  //usecases
  di.registerSingleton(
      LocalCheckUserLoggedIn(cacheStorage: di<LocalStorageAdapter>()));

  di.registerSingleton(RemoteAuthentication());

  di.registerSingleton(GetDeviceInformations(di<DeviceInfoPlugin>()));

  di.registerSingleton(RemoteGetCurrentCovidInfos(
      httpClient: di<HttpAdapter>(), url: '$baseUrl/us/current.json'));

  di.registerSingleton(RemoteGetListInfo(
      httpClient: di<HttpAdapter>(), url: '$baseUrl/states/info.json'));

  di.registerSingleton(RemoteGetListCurrent(
      httpClient: di<HttpAdapter>(), url: '$baseUrl/states/current.json'));
  //controllers

  di.registerSingleton(
      SplashStore(localCheckUserLoggedIn: di<LocalCheckUserLoggedIn>()));

  di.registerSingleton(LoginStore(
      remoteAuthentication: di<RemoteAuthentication>(),
      localStorageAdapter: di<LocalStorageAdapter>()));

  di.registerSingleton(HomeStore(
    di<GetDeviceInformations>(),
    di<RemoteGetCurrentCovidInfos>(),
    di<LocalStorageAdapter>(),
  ));

  di.registerSingleton(MoreDetailsStore(
      remoteGetListCurrent: di<RemoteGetListCurrent>(),
      remoteGetListInfo: di<RemoteGetListInfo>()));
}
