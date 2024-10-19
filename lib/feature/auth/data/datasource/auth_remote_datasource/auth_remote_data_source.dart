import '../../../../../core/api/api_result.dart';
import '../../../domain/entity/user.dart';

abstract class AuthRemoteDataSource{
  Future<Result<User?>> register({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });
  Future<Result<User?>> login(
      {required String email, required String password});
  Future<Result<String?>> forgetPassword({required String email});
  Future<Result<String?>> verifyResetCode({required String resetCode});
  Future<Result<User?>> resetPassword(
      {required String email, required String newPassword});
}