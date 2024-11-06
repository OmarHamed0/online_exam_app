import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/auth/domain/entity/user.dart';
import 'package:online_exam/feature/auth/domain/usecase/reset_password_use_case.dart';

import 'auth_repository_mock.mocks.dart';

void main() {
  late ResetPasswordUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = ResetPasswordUseCase(mockRepository);
  });
  setUpAll(() {
    provideDummy<Result<User?>>(Success<User?>(data: null));
  });
  group("ForgetPasswordUseCase", () {
    const String testEmail = "test@example.com";
    const String testNewPassword = "newPassword1";
    final testUser=User();
    test("should return Success when reset password is successful", () async {
      when(mockRepository.resetPassword(email: testEmail,newPassword: testNewPassword))
          .thenAnswer((_) async => Success<User?>(data: testUser));
      final result = await useCase.invoke(email: testEmail, newPassword: testNewPassword);
      expect(result, isA<Success<User?>>());
      expect((result as Success).data, equals(testUser));
    });
    test("should return Fail when reset password fails", () async {
      when(mockRepository.resetPassword(email: testEmail,newPassword: testNewPassword))
          .thenAnswer((_) async => Fail<User?>(exception: Exception("Reset password failed")));
      final result = await useCase.invoke(email: testEmail, newPassword: testNewPassword);
      expect(result, isA<Fail<User?>>());
      expect((result as Fail).exception.toString(), equals("Exception: Reset password failed"));
    });

  });
}
