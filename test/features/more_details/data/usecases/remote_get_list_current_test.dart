import 'package:covid_traking/core/core.dart';
import 'package:covid_traking/core/models/models.dart';
import 'package:covid_traking/features/more_details/data/usecases/remote_get_list_current.dart';
import 'package:covid_traking/features/more_details/domain/entities/state_entity.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late RemoteGetListCurrent usecase;
  late MockHttpClient mockHttpClient;
  late String url;
  late List<StateEntity> states;
  StateEntity makeState() => StateEntity(
        name: faker.address.city(),
        state: faker.address.countryCode(),
        image: faker.image.image(),
        totalCases: faker.randomGenerator.integer(100),
        lastModified: faker.date.dateTime().toString(),
        x: faker.internet.httpUrl(),
        notes: faker.lorem.sentence(),
      );

  setUp(() {
    mockHttpClient = MockHttpClient();
    url = faker.internet.httpUrl();
    states = [makeState(), makeState(), makeState()];
    usecase = RemoteGetListCurrent(
      httpClient: mockHttpClient,
      url: url,
    );
  });

  test('should return a list of StateEntity', () async {
    final httpResponse = [
      StateModel.fromEntity(states[0]).toJson(),
      StateModel.fromEntity(states[1]).toJson(),
      StateModel.fromEntity(states[2]).toJson(),
    ];

    when(() => mockHttpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'))).thenAnswer((_) async => httpResponse);

    when(() => mockHttpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'))).thenAnswer((_) async => httpResponse);

    final result = await usecase(states);

    verify(() => mockHttpClient.request(url: url, method: 'get')).called(1);
    expect(result, isA<List<StateEntity>>());
    expect(result.length, equals(3));
    expect(result[0].name, equals(states[0].name));
    expect(result[0].state, equals(states[0].state));
    expect(result[0].totalCases, equals(httpResponse[0]['total']));
    expect(result[0].lastModified, equals(httpResponse[0]['lastUpdateEt']));
  });

  test('should throw a server error if the HTTP request fails', () async {
    when(() => mockHttpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'))).thenThrow(HttpError.serverError);

    final future = usecase(states);

    expect(future, throwsA(DomainError.serverError));
  });

  test(
      'should throw an unexpected error if the HTTP request fails with any other error',
      () async {
    when(() => mockHttpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'))).thenThrow(HttpError.invalidData);

    final future = usecase([]);

    expect(future, throwsA(DomainError.unexpected));
  });
}
