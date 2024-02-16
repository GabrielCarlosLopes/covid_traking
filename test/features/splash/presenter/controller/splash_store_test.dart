import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:faker/faker.dart';

import 'package:covid_traking/features/splash/presenter/controllers/splash_store.dart';
import 'package:covid_traking/features/splash/data/usecases/local_check_user_logged_in.dart';

import '../../data/mocks/cache_storage_spy.dart';

class LocalCheckUserLoggedInMock extends Mock
    implements LocalCheckUserLoggedIn {}

void main() {
  late SplashStore splashStore;
  late LocalCheckUserLoggedInMock localCheckUserLoggedInMock;
  late CacheStorageSpy cacheStorage;

  setUp(() {
    cacheStorage = CacheStorageSpy();
    cacheStorage.mockFetch(true);
    localCheckUserLoggedInMock = LocalCheckUserLoggedInMock();
    splashStore =
        SplashStore(localCheckUserLoggedIn: localCheckUserLoggedInMock);
  });

  test('Should set isLoading to true when checkUserLoggedIn is called',
      () async {
    // Arrange
    when(() => localCheckUserLoggedInMock.call()).thenAnswer((_) async => true);

    // Act
    splashStore.checkUserLoggedIn();

    expect(splashStore.isLoading, true);
    // Assert
  });

  test('Should call localCheckUserLoggedIn when checkUserLoggedIn is called',
      () async {
    // Arrange

    final fakeUserLogged = faker.randomGenerator.boolean();
    when(() => localCheckUserLoggedInMock.call())
        .thenAnswer((_) async => fakeUserLogged);

    // Act
    await splashStore.checkUserLoggedIn();

    // Assert
    verify(() => localCheckUserLoggedInMock.call()).called(1);
  });

  test('Should set redirect to "/home" when user is logged in', () async {
    // Arrange

    const fakeUserLogged = true;
    when(() => localCheckUserLoggedInMock.call())
        .thenAnswer((_) async => fakeUserLogged);

    // Act
    await splashStore.checkUserLoggedIn();

    // Assert
    expect(splashStore.redirect, '/home');
  });

  test('Should set redirect to "/login" when user is not logged in', () async {
    // Arrange

    const fakeUserLogged = false;
    when(() => localCheckUserLoggedInMock.call())
        .thenAnswer((_) async => fakeUserLogged);

    // Act
    await splashStore.checkUserLoggedIn();

    // Assert
    expect(splashStore.redirect, '/login');
  });

  test('Should set redirect to "/login" when an exception is thrown', () async {
    // Arrange

    when(() => localCheckUserLoggedInMock.call()).thenThrow(Exception());

    // Act
    await splashStore.checkUserLoggedIn();

    // Assert
    expect(splashStore.redirect, '/login');
  });

  test('Should set isLoading to false when checkUserLoggedIn is completed',
      () async {
    // Arrange
    when(() => localCheckUserLoggedInMock.call())
        .thenAnswer((_) async => false);

    // Act
    await splashStore.checkUserLoggedIn();

    // Assert
    expect(splashStore.isLoading, false);
  });
}
