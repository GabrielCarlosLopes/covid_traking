import 'package:covid_traking/core/core.dart';
import 'package:covid_traking/features/home/data/usecases/remote_get_current_covid_infos.dart';
import 'package:covid_traking/features/home/domain/entities/covid_infos_entity.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late RemoteGetCurrentCovidInfos usecase;
  late MockHttpClient mockHttpClient;
  late String url;

  setUp(() {
    mockHttpClient = MockHttpClient();
    url = faker.internet.httpUrl();
    usecase = RemoteGetCurrentCovidInfos(
      httpClient: mockHttpClient,
      url: url,
    );
  });

  test('should perform a GET request to the specified URL', () async {
    final expectedEntity = CovidInfosEntity(
      deaths: faker.randomGenerator.integer(100),
      positive: faker.randomGenerator.integer(1000),
      recovered: faker.randomGenerator.integer(900),
      lastModified: faker.date.dateTime().toIso8601String(),
      negative: faker.randomGenerator.integer(100),
      pending: faker.randomGenerator.integer(100),
      total: faker.randomGenerator.integer(100),
    );
    final mockResponse = [
      {
        'death': expectedEntity.deaths,
        'positive': expectedEntity.positive,
        'recovered': expectedEntity.recovered,
        'lastModified': expectedEntity.lastModified,
        'negative': expectedEntity.negative,
        'pending': expectedEntity.pending,
        'total': expectedEntity.total,
      }
    ];

    when(() => mockHttpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'))).thenAnswer((_) async => mockResponse);

    final result = await usecase();

    verify(() => mockHttpClient.request(url: url, method: 'get')).called(1);
    expect(result, equals(expectedEntity));
  });

  test(
      'should throw a server error if the HTTP request fails with a server error',
      () async {
    when(() => mockHttpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'))).thenThrow(HttpError.serverError);

    final future = usecase();

    expect(future, throwsA(DomainError.serverError));
  });

  test(
      'should throw an unexpected error if the HTTP request fails with any other error',
      () async {
    when(() => mockHttpClient.request(
        url: any(named: 'url'),
        method: any(named: 'method'))).thenThrow(HttpError.invalidData);

    final future = usecase();

    expect(future, throwsA(DomainError.unexpected));
  });
}
