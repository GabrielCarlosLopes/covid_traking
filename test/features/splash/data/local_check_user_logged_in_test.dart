import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:covid_traking/core/core.dart';
import 'package:covid_traking/features/splash/data/usecases/local_check_user_logged_in.dart';

import 'mocks/cache_storage_spy.dart';

void main() {
  late LocalCheckUserLoggedIn sut;
  late CacheStorageSpy cacheStorage;

  setUp(() {
    cacheStorage = CacheStorageSpy();
    cacheStorage.mockFetch(true);
    sut = LocalCheckUserLoggedIn(cacheStorage: cacheStorage);
  });

  test('Should call fetch on CacheStorage', () async {
    await sut.call();

    verify(() => cacheStorage.fetch('logged'));
  });

  test('Should return true if fetch returns true', () async {
    when(() => cacheStorage.fetch('logged')).thenAnswer((_) async => true);

    final result = await sut.call();

    expect(result, true);
  });

  test('Should return false if fetch returns false', () async {
    when(() => cacheStorage.fetch('logged')).thenAnswer((_) async => false);

    final result = await sut.call();

    expect(result, false);
  });

  test('Should throw DomainError.unexpected if fetch throws', () async {
    when(() => cacheStorage.fetch('logged')).thenThrow(Exception());

    final future = sut.call();

    expect(future, throwsA(DomainError.unexpected));
  });
}
