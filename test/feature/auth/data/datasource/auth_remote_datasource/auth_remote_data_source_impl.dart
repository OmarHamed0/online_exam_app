
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/feature/auth/data/api/auth_api_manger.dart';
import 'package:online_exam/feature/auth/data/datasource/auth_remote_datasource/auth_remote_data_source_impl.dart';
import 'package:online_exam/feature/auth/data/model/request/login_request.dart';
import 'package:online_exam/feature/auth/data/model/request/register_request.dart';
import 'package:online_exam/feature/auth/data/model/response/auth_response.dart';
import 'package:online_exam/feature/auth/domain/entity/user.dart';

import 'auth_remote_data_source_impl.mocks.dart';

@GenerateMocks([AuthApiManger])
void main() {
  late MockAuthApiManger mockApiManger;
  late AuthRemoteDataSourceImpl authRemoteDataSource;

  setUp(() {
    mockApiManger = MockAuthApiManger();
    authRemoteDataSource = AuthRemoteDataSourceImpl(apiManger: mockApiManger);
  });
//login
  group("login", () {
    test("should return User object when login is successful", () async {
      const testToken = "12345";
      final loginResponse = AuthResponse(token: testToken);
      const testEmail = "Rawan@123";
      const testPassword = "12345";
      final testLoginRequest =
          LoginRequest(email: testEmail, password: testPassword);
      when(mockApiManger.login(loginRequest: testLoginRequest))
          .thenAnswer((_) async => loginResponse);
      final result = await authRemoteDataSource.login(
          email: testEmail, password: testPassword);
      expect(result, isA<Success<User?>>());
      expect((result as Success<User?>).data?.token, testToken);
    });
    test("should return Failure when login fails", () async {
      const testEmail = "wrong@example.com";
      const testPassword = "wrongPassword";
      when(mockApiManger.login(
        loginRequest: LoginRequest(email: testEmail, password: testPassword),
      )).thenThrow(Exception("Login failed"));
      final result = await authRemoteDataSource.login(
          email: testEmail, password: testPassword);
      expect(result, isA<Fail<User?>>());
      expect(
          (result as Fail<User?>).exception, equals("Exception: Login failed"));
    });
  });

//forgetPassword
  test("should return success message when forgetPassword is successful",
      () async {
    const testEmail = "Rawan@123";
    const testMessage = "Password reset email sent.";
    when(mockApiManger.forgetPassword(email: testEmail))
        .thenAnswer((_) async => testMessage);
    final result = await authRemoteDataSource.forgetPassword(email: testEmail);
    expect(result, isA<Success<String?>>());
    expect((result as Success<String?>).data, testMessage);
  });

  //register
  test("should return User object when register is successful", () async {
    const testToken = "1234";
    final testRegisterRequest = RegisterRequest(
      username: "Rawan",
      firstName: "Rawan",
      lastName: "Magdy",
      password: "Rawan@123",
      rePassword: "Rawan@123",
      email: "Rawan@magdy",
      phone: "01092847653",
    );
    final registerResponse = AuthResponse(token: testToken);
    when(mockApiManger.register(registerRequest: testRegisterRequest))
        .thenAnswer((_) async => registerResponse);
    final result = await authRemoteDataSource.register(
      username: "Rawan1",
      firstName: "Rawan",
      lastName: "Magdy",
      password: "Rawan@123",
      rePassword: "Rawan@123",
      email: "Rawan@magdy",
      phone: "01092847653",
    );
    expect(result, isA<Success<User?>>());
    expect((result as Success<User?>).data?.token, testToken);
  });
  //resetPassword
  test("should return User object when resetPassword is successful", () async {
    const testEmail = "Rawan@123";
    const testToken = "123";
    const testNewPassword = "1234";
    final resetPasswordResponse = AuthResponse(token: testToken);
    when(mockApiManger.resetPassword(
            email: testEmail, newPassword: testNewPassword))
        .thenAnswer((_) async => resetPasswordResponse);
    final result = await authRemoteDataSource.resetPassword(
        email: testEmail, newPassword: testNewPassword);
    expect(result, isA<Success<User?>>());
    expect((result as Success<User?>).data?.token, testToken);
  });

  //verifyResetCode
  test("should return User object when verifyResetCode is successful",
      () async {
    const testResetCode = "12345";
    const testMessage = "verify Code";
    when(mockApiManger.emailVerification(resetCode: testResetCode))
        .thenAnswer((_) async => testMessage);
    final result =
        await authRemoteDataSource.verifyResetCode(resetCode: testResetCode);
    expect(result, isA<Success<String?>>());
    expect((result as Success<String?>).data, testMessage);
  });
}
