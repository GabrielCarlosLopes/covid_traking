import 'package:covid_traking/core/core.dart';

import '../../../../core/models/models.dart';
import '../../domain/entities/covid_infos_entity.dart';
import '../../domain/usecases/get_current_covid_infos.dart';

class RemoteGetCurrentCovidInfos implements GetCurrentCovidInfos {
  final HttpClient httpClient;
  final String url;

  RemoteGetCurrentCovidInfos({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<CovidInfosEntity> call() async {
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: 'get',
      );

      return CovidInfosModel.fromJson(httpResponse[0]).toEntity();
    } catch (error) {
      if (error == HttpError.serverError) {
        throw DomainError.serverError;
      } else {
        throw DomainError.unexpected;
      }
    }
  }
}
