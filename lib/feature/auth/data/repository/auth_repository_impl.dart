
import '../../../../core/api/api_result.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_remote_datasource/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Result<String?>> forgetPassword({required String email}) {
   return authRemoteDataSource.forgetPassword(email: email);
  }

  @override
  Future<Result<User?>> login({required String email, required String password}) {
    return authRemoteDataSource.login(email: email, password: password);
  }

  @override
  Future<Result<User?>> register({required String username, required String firstName, required String lastName, required String email, required String password, required String rePassword, required String phone}) {
    return authRemoteDataSource.register(username: username, firstName: firstName, lastName: lastName, email: email, password: password, rePassword: rePassword, phone: phone);
  }

  @override
  Future<Result<User?>> resetPassword({required String email, required String newPassword}) {
    return authRemoteDataSource.resetPassword(email: email, newPassword: newPassword);
  }

  @override
  Future<Result<String?>> verifyResetCode({required String resetCode}) {
    return authRemoteDataSource.verifyResetCode(resetCode: resetCode);
  }
}