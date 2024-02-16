import '../../../../core/core.dart';
import '../../../../features/splash/domain/usecases/usecases.dart';

class LocalCheckUserLoggedIn implements CheckUserLoggedInUseCase {
  final CacheStorage cacheStorage;

  LocalCheckUserLoggedIn({required this.cacheStorage});

  @override
  Future<bool> call() async {
    try {
      final logged = await cacheStorage.fetch('logged');
      if (logged == null) throw Error();
      return logged;
    } catch (e) {
      throw DomainError.unexpected;
    }
  }
}
