import 'package:covid_traking/features/login/domain/usecases/authentication.dart';
import 'package:faker/faker.dart';

class ParamsFactory {
  static AuthenticationParams makeAuthentication() =>
      const AuthenticationParams(
        documentType: "rg",
        documentNumber: "123456789",
        password: "123456",
      );
  static AuthenticationParams makeInvalidAuthentication() =>
      AuthenticationParams(
        documentType: faker.lorem.word().toLowerCase(),
        documentNumber: faker.lorem.word().toLowerCase(),
        password: faker.internet.password(),
      );
}
