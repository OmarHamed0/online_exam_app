import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/auth/domain/usecase/verify_reset_code_use_case.dart';

import 'auth_repository_mock.mocks.dart';

void main() {
  late VerifyResetCodeUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = VerifyResetCodeUseCase(authRepository: mockRepository);
  });
  setUpAll(() {
    provideDummy<Result<String?>>(Success<String?>(data: null));
  });
  group("VerifyResetCodeUseCase", () {
    const String testResetCode = "1234";
    test("should return Success when reset code is successful", () async {
      when(mockRepository.verifyResetCode(
              resetCode: testResetCode))
          .thenAnswer((_) async => Success<String?>(data: "reset code successful"));
      final result = await useCase.invoke(resetCode: testResetCode);
      expect(result, isA<Success<String?>>());
      expect((result as Success).data, equals("reset code successful"));
    });
    test("should return Fail when reset code verification fails", () async {
      when(mockRepository.verifyResetCode(resetCode: testResetCode))
          .thenAnswer((_) async =>
          Fail<String?>(exception: Exception("Reset Code failed")));
      final result = await useCase.invoke(resetCode: testResetCode);
      expect(result, isA<Fail<String?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: Reset Code failed"));
    });
  });
}
