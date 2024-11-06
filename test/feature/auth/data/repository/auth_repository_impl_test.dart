import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/auth/data/datasource/auth_remote_datasource/auth_remote_data_source.dart';
import 'package:online_exam/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:online_exam/feature/auth/domain/entity/user.dart';
import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late AuthRepositoryImpl authRepository;
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    authRepository =
        AuthRepositoryImpl(authRemoteDataSource: mockAuthRemoteDataSource);
  });
  setUpAll(() {
    provideDummy<Result<String?>>(Success<String?>(data: null));
    provideDummy<Result<User?>>(Success<User?>(data: null));
  });

  //forgetPassword
  group("forgetPassword - AuthRepositoryImpl", () {
    const String testEmail = "testtEmail@123";
    test(
        "should return Success for forgetPassword when remote call is successful",
        () async {
      when(mockAuthRemoteDataSource.forgetPassword(email: testEmail))
          .thenAnswer(
              (_) async => Success<String?>(data: "Email sent successfully"));
      final result = await authRepository.forgetPassword(email: testEmail);
      expect(result, isA<Success<String?>>());
      expect((result as Success).data, equals("Email sent successfully"));
    });
    test("should return Fail for forgetPassword when remote call is fails",
        () async {
      when(mockAuthRemoteDataSource.forgetPassword(email: testEmail))
          .thenAnswer((_) async =>
              Fail<String?>(exception: Exception("Failed to send email")));
      final result = await authRepository.forgetPassword(email: testEmail);
      expect(result, isA<Fail<String?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: Failed to send email"));
    });
  });

  //login
  group("login - AuthRepositoryImpl", () {
    const String testEmail = "testEmail@123";
    const String testPassword = "123";
    final testUser = User();
    test(
        "should return Success when login call is successful",
        () async {
      when(mockAuthRemoteDataSource.login(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async => Success<User?>(data: testUser));
      final result =
          await authRepository.login(email: testEmail, password: testPassword);
      expect(result, isA<Success<User?>>());
      expect((result as Success).data, equals(testUser));
    });
    test("should return Fail when login call fails",
        () async {
      when(mockAuthRemoteDataSource.login(
              email: testEmail, password: testPassword))
          .thenAnswer((_) async =>
              Fail<User?>(exception: Exception("failed to login")));
      final result =
          await authRepository.login(email: testEmail, password: testPassword);
      expect(result, isA<Fail<User?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: failed to login"));
    });
  });

  //register
  group("register - AuthRepositoryImpl", () {
    const String testUserName = "RAWAN1";
    const String testFirstName = "RAWAN";
    const String testLastName = "Magdy";
    const String testEmail = "RAWAN@123";
    const String testPassword = "123";
    const String testRePassword = "123";
    const String testPhone = "01098766538";
    final testUser = User();

    test("should return Success when register call is successful", () async {
      when(mockAuthRemoteDataSource.register(
              username: testUserName,
              firstName: testFirstName,
              lastName: testLastName,
              email: testEmail,
              password: testPassword,
              rePassword: testRePassword,
              phone: testPhone))
          .thenAnswer((_) async => Success<User?>(data: testUser));
      final result = await authRepository.register(
          firstName: testFirstName,
          lastName: testLastName,
          email: testEmail,
          password: testPassword,
          rePassword: testRePassword,
          phone: testPhone,
          username: testUserName);
      expect(result, isA<Success<User?>>());
      expect((result as Success).data, equals(testUser));
    });
    test("should return Fail when register call fails", () async {
      when(mockAuthRemoteDataSource.register(
              username: testUserName,
              firstName: testFirstName,
              lastName: testLastName,
              email: testEmail,
              password: testPassword,
              rePassword: testRePassword,
              phone: testPhone))
          .thenAnswer((_) async =>
              Fail<User?>(exception: Exception("failed to register")));
      final result = await authRepository.register(
          firstName: testFirstName,
          lastName: testLastName,
          email: testEmail,
          password: testPassword,
          rePassword: testRePassword,
          phone: testPhone,
          username: testUserName);
      expect(result, isA<Fail<User?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: failed to register"));
    });
  });

  //resetPassword
  group("resetPassword - AuthRepositoryImpl", () {
    const String testEmail = "RAWAN@123";
    const String testNewPassword = "123";
    final testUser = User();

    test("should return Success when resetPassword call is successful", () async {
      when(mockAuthRemoteDataSource.resetPassword(
              email: testEmail, newPassword: testNewPassword))
          .thenAnswer((_) async => Success<User?>(data: testUser));
      final result = await authRepository.resetPassword(
          email: testEmail, newPassword: testNewPassword);
      expect(result, isA<Success<User?>>());
      expect((result as Success).data, equals(testUser));
    });
    test("should return Fail when resetPassword call fails", () async {
      when(mockAuthRemoteDataSource.resetPassword(
              email: testEmail, newPassword: testNewPassword))
          .thenAnswer((_) async =>
              Fail<User?>(exception: Exception("failed resetPassword")));
      final result = await authRepository.resetPassword(
          email: testEmail, newPassword: testNewPassword);
      expect(result, isA<Fail<User?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: failed resetPassword"));
    });
  });

  //verifyResetCode
  group("verifyResetCode - AuthRepositoryImpl", () {
    const String testResetCode = "12345";
    test("should return Success when verifyResetCode call is successful", () async {
      when(mockAuthRemoteDataSource.verifyResetCode(resetCode: testResetCode))
          .thenAnswer((_) async => Success<String?>(data:"verifyResetCode sent successfully"));
      final result =
          await authRepository.verifyResetCode(resetCode: testResetCode);
      expect(result, isA<Success<String?>>());
      expect((result as Success).data, equals("verifyResetCode sent successfully"));
    });
    test("should return Fail when verifyResetCode call fails", () async {
      when(mockAuthRemoteDataSource.verifyResetCode(resetCode: testResetCode))
          .thenAnswer((_) async =>
              Fail<String?>(exception: Exception("failed resetVerifyCode")));
      final result =
          await authRepository.verifyResetCode(resetCode: testResetCode);
      expect(result, isA<Fail<String?>>());
      expect((result as Fail).exception.toString(),
          equals("Exception: failed resetVerifyCode"));
    });
  });
}
