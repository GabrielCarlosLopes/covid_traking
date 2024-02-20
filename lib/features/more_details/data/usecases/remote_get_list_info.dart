import 'package:covid_traking/core/models/state_model.dart';

import '../../../../core/core.dart';
import '../../domain/entities/state_entity.dart';
import '../../domain/usecases/get_list_info.dart';

class RemoteGetListInfo implements GetListInfo {
  final HttpClient httpClient;
  final String url;

  RemoteGetListInfo({required this.httpClient, required this.url});

  @override
  Future<List<StateEntity>> call() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      List<StateEntity> states = [];
      for (var element in httpResponse) {
        states.add(StateModel.fromJson(element).toEntity());
      }

      return states;
    } catch (error) {
      throw error == HttpError.serverError
          ? DomainError.serverError
          : DomainError.unexpected;
    }
  }
}
