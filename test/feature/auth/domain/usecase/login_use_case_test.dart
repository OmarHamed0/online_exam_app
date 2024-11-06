import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/auth/domain/entity/user.dart';
import 'package:online_exam/feature/auth/domain/usecase/login_use_case.dart';

import 'auth_repository_mock.mocks.dart';

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });
  setUpAll(() {
    provideDummy<Result<User?>>(Success<User?>(data: null));
  });

  group("LoginUseCase", () {
    const String testEmail = "test@example.com";
    const String testPassword = "123";
    final testUser = User();
    test("should return Success when login is successful", () async {
      when(mockRepository.login(email: testEmail, password: testPassword))
          .thenAnswer((_) async => Success<User?>(data: testUser));
      final result =
          await useCase.invoke(email: testEmail, password: testPassword);
      expect(result, isA<Success<User?>>());
      expect((result as Success).data, equals(testUser));
    });
    test("should return Fail when login is fail", () async {
      when(mockRepository.login(email: testEmail, password: testPassword))
          .thenAnswer((_) async => Fail(exception: Exception("Failed login")));
      final result =
          await useCase.invoke(email: testEmail, password: testPassword);
      expect(result, isA<Fail<User?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: Failed login"));
    });
  });
}
