import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/response/auth_response.dart';

abstract class AuthApiManger {
  Future<AuthResponse> login({required LoginRequest loginRequest});
  Future<AuthResponse> register({required RegisterRequest registerRequest});

  Future<String?> forgetPassword({
    required String email,
  });

  Future<String?> emailVerification({
    required String resetCode,
  });

  Future<AuthResponse?> resetPassword(
      {required String email, required String newPassword});
}
