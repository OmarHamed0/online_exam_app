import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/auth/domain/usecase/forget_password_use_case.dart';

import 'auth_repository_mock.mocks.dart';

void main() {
  late ForgetPasswordUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = ForgetPasswordUseCase(mockRepository);
  });
  setUpAll(() {
    provideDummy<Result<String?>>(Success<String?>(data: null));
  });
  group("ForgetPasswordUseCase", () {
    const String testEmail = "test@example.com";
    test("should return Success when forget password is successful", () async {
      when(mockRepository.forgetPassword(email: testEmail))
          .thenAnswer((_) async => Success<String?>(data: "Password reset email sent"));
      final result = await useCase.invoke(email: testEmail);
      expect(result, isA<Success<String?>>());
      expect((result as Success).data, equals("Password reset email sent"));
    });
    test("should return Fail when forget password fails", () async {
      when(mockRepository.forgetPassword(email: testEmail))
          .thenAnswer((_) async => Fail<String?>(exception: Exception("Failed to reset password")));
      final result = await useCase.invoke(email: testEmail);
      expect(result, isA<Fail<String?>>());
      expect((result as Fail).exception.toString(), equals("Exception: Failed to reset password"));
    });

  });
}
