import 'package:covid_traking/features/more_details/domain/entities/state_entity.dart';

abstract class GetListInfo {
  Future<List<StateEntity>> call();
}
