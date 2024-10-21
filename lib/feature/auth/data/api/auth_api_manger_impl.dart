import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/response/auth_response.dart';
import 'package:injectable/injectable.dart';

import 'auth_api_manger.dart';

@Injectable(as: AuthApiManger)
class AuthApiMangerImpl implements AuthApiManger {
  late Dio _dio;
  AuthApiMangerImpl() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    _dio.interceptors.add(LogInterceptor(
      responseHeader: true,
      requestBody: true,
      request: true,
      requestHeader: true,
      error: true,

    ));
  }
  @override
  Future<AuthResponse> login({required LoginRequest loginRequest}) async {
    var response =
        await _dio.post(ApiConstants.signInUrl, data: loginRequest.toJson());
    AuthResponse authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }

  @override
  Future<AuthResponse> register(
      {required RegisterRequest registerRequest}) async {
    var response =
        await _dio.post(ApiConstants.signupUrl, data: registerRequest.toJson());
    AuthResponse authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }

  @override
  Future<String?> forgetPassword({
    required String email,
  }) async {
    var response =
        await _dio.post(ApiConstants.forgetPasswordApi, data: {"email": email});
    return response.data["message"];
  }

  @override
  Future<String?> emailVerification({
    required String resetCode,
  }) async {
    var response = await _dio
        .post(ApiConstants.verifyResetCodeApi, data: {"resetCode": resetCode});
    return response.data["status"];
  }

  @override
  Future<AuthResponse?> resetPassword(
      {required String email, required String newPassword}) async {
    var response = await _dio.put(ApiConstants.resetPasswordApi,
        data: {"email": email, "newPassword": newPassword});
    AuthResponse authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }
}
