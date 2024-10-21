import 'package:online_exam/core/caching/token_manger.dart';

import '../../../../../core/api/api_result.dart';
import '../../../../../core/api/execute_api_call.dart';
import '../../../domain/entity/user.dart';
import '../../api/auth_api_manger.dart';
import '../../model/request/login_request.dart';
import '../../model/request/register_request.dart';
import 'auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiManger apiManger;
  AuthRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Result<String?>> forgetPassword({required String email}) {
    return executeApiCall<String?>(
      apiCall: () async {
        String? massage = await apiManger.forgetPassword(email: email);
        return massage;
      },
    );
  }

  @override
  Future<Result<User?>> login(
      {required String email, required String password}) async {
    return executeApiCall<User?>(
      apiCall: () async {
        var authResponse = await apiManger.login(
            loginRequest: LoginRequest(email: email, password: password));
       return User(token: authResponse.token);
        },
    );
  }

  @override
  Future<Result<User?>> register(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String rePassword,
      required String phone}) async {
    return executeApiCall<User?>(
      apiCall: () async {
        var authResponse = await apiManger.register(
            registerRequest: RegisterRequest(
                rePassword: rePassword,
                phone: phone,
                password: password,
                email: email,
                username: username,
                firstName: firstName,
                lastName: lastName)
        );
        User? user = User(token: authResponse.token);
        return user;
      },
    );
  }

  @override
  Future<Result<User?>> resetPassword(
      {required String email, required String newPassword}) {
    return executeApiCall<User?>(
      apiCall: () async {
        var authResponse = await apiManger.resetPassword(
            email: email, newPassword: newPassword);
        User? user = User(token: authResponse?.token);
        return user;
      },
    );
  }

  @override
  Future<Result<String?>> verifyResetCode({required String resetCode}) {
    return executeApiCall<String?>(
      apiCall: () async {
        String? massage =
            await apiManger.emailVerification(resetCode: resetCode);
        return massage;
      },
    );
  }
}
