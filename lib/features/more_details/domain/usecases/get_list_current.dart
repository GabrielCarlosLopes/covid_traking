import '../entities/state_entity.dart';

abstract class GetListCurrent {
  Future<List<StateEntity>> call(List<StateEntity> states);
}
