import 'package:covid_traking/features/home/domain/entities/covid_infos_entity.dart';

abstract class GetCurrentCovidInfos {
  Future<CovidInfosEntity> call();
}
