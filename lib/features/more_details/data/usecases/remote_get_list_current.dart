import 'package:covid_traking/core/constants/api_endpoints.dart';
import 'package:covid_traking/features/more_details/domain/usecases/get_list_current.dart';

import '../../../../core/core.dart';
import '../../domain/entities/state_entity.dart';

class RemoteGetListCurrent implements GetListCurrent {
  final HttpClient httpClient;
  final String url;

  RemoteGetListCurrent({required this.httpClient, required this.url});

  @override
  Future<List<StateEntity>> call(List<StateEntity> states) async {
    try {
      List<StateEntity> list = [];
      final httpResponse = await httpClient.request(url: url, method: 'get');

      for (var element in httpResponse) {
        for (var state in states) {
          if (element['state'].toString().toUpperCase() ==
              state.state!.toUpperCase()) {
            list.add(StateEntity(
              name: state.name,
              state: state.state,
              image:
                  '$baseFlagsUrl/${state.name!.toLowerCase().replaceAll(' ', '-')}-small.png',
              totalCases: element['total'],
              lastModified: element['lastUpdateEt'],
            ));
          }
        }
      }

      return list;
    } on HttpError catch (error) {
      throw error == HttpError.serverError
          ? DomainError.serverError
          : DomainError.unexpected;
    }
  }
}
