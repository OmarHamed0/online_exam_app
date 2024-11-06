import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/auth/domain/entity/user.dart';
import 'package:online_exam/feature/auth/domain/usecase/register_use_case.dart';

import 'auth_repository_mock.mocks.dart';

void main() {
  late RegisterUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = RegisterUseCase(authRepository: mockRepository);
  });
  setUpAll(() {
    provideDummy<Result<User?>>(Success<User?>(data: null));
  });

  group("RegisterUseCase", () {
    const String testUserName = "RAWAN1";
    const String testFirstName = "RAWAN";
    const String testLastName = "Magdy";
    const String testEmail = "RAWAN@123";
    const String testPassword = "123";
    const String testRePassword = "123";
    const String testPhone = "01098766538";
    final testUser = User();
    test("should return Success when SignUp is successful", () async {
      when(mockRepository.register(
              username: testUserName,
              firstName: testFirstName,
              lastName: testLastName,
              email: testEmail,
              password: testPassword,
              rePassword: testRePassword,
              phone: testPhone))
          .thenAnswer((_) async => Success<User?>(data: testUser));
      final result = await useCase.invoke(testUserName, testFirstName,
          testLastName, testEmail, testPassword, testRePassword, testPhone);
      expect(result, isA<Success<User?>>());
      expect((result as Success).data, equals(testUser));
    });
    test("should return fail when SignUp is fails", () async {
      when(mockRepository.register(
              username: testUserName,
              firstName: testFirstName,
              lastName: testLastName,
              email: testEmail,
              password: testPassword,
              rePassword: testRePassword,
              phone: testPhone))
          .thenAnswer(
              (_) async => Fail<User?>(exception: Exception("Failed signUp")));
      final result = await useCase.invoke(testUserName, testFirstName,
          testLastName, testEmail, testPassword, testRePassword, testPhone);
      expect(result, isA<Fail<User?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: Failed signUp"));
    });
  });
}
