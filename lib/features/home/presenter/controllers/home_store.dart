import 'package:covid_traking/core/cache/cache.dart';
import 'package:covid_traking/core/models/models.dart';
import 'package:covid_traking/features/home/data/usecases/get_device_informations.dart';
import 'package:covid_traking/features/home/data/usecases/remote_get_current_covid_infos.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetDeviceInformations getDeviceInformations;

  final RemoteGetCurrentCovidInfos remoteGetCurrentCovidInfos;

  final CacheStorage cacheStorage;

  HomeStoreBase(
    this.getDeviceInformations,
    this.remoteGetCurrentCovidInfos,
    this.cacheStorage,
  );

  @observable
  bool isLoading = false;

  @observable
  String? redirect;

  @observable
  String? errorMessage;

  @observable
  DeviceModel? deviceModel;

  @observable
  CovidInfosModel? covidInfosModel;

  @computed
  bool get hasError => errorMessage != null;

  @computed
  bool get redirectIsValid => redirect != null;

  @action
  void setError(String value) => errorMessage = value;

  @action
  Future<void> getDeviceInformationsData(bool isAndroid) async {
    try {
      deviceModel = DeviceModel.fromEntity(
        await getDeviceInformations.call(isAndroid: isAndroid),
      );
    } catch (e) {
      setError(e.toString());
    }
  }

  @action
  Future<void> getCurrentCovidInfos() async {
    isLoading = true;
    try {
      covidInfosModel =
          CovidInfosModel.fromEntity(await remoteGetCurrentCovidInfos.call());
    } catch (e) {
      setError(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> saveUserLogged() async {
    try {
      await cacheStorage.save(key: 'logged', value: false);

      redirect = '/login';
    } on Exception catch (e) {
      setError('${e}Erro ao realizar logout!');
    }
  }

  @action
  Stream<DateTime> currentTimeStream() {
    return Stream.periodic(const Duration(seconds: 1), (x) => DateTime.now());
  }
}
