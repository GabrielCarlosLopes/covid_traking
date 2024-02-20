import 'package:covid_traking/core/models/state_model.dart';
import 'package:covid_traking/features/more_details/data/usecases/remote_get_list_current.dart';
import 'package:covid_traking/features/more_details/data/usecases/remote_get_list_info.dart';
import 'package:mobx/mobx.dart';
part 'more_details_store.g.dart';

class MoreDetailsStore = MoreDetailsStoreBase with _$MoreDetailsStore;

abstract class MoreDetailsStoreBase with Store {
  final RemoteGetListCurrent remoteGetListCurrent;
  final RemoteGetListInfo remoteGetListInfo;

  MoreDetailsStoreBase({
    required this.remoteGetListCurrent,
    required this.remoteGetListInfo,
  });

  @observable
  bool isLoading = false;

  @observable
  ObservableList<StateModel>? states;

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  @action
  Future<void> getList() async {
    try {
      isLoading = true;

      final listInfo = await remoteGetListInfo.call();

      final listCurrent = await remoteGetListCurrent.call(listInfo);

      states = ObservableList.of(
          listCurrent.map((e) => StateModel.fromEntity(e)).toList());
    } catch (e) {
      setError(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
