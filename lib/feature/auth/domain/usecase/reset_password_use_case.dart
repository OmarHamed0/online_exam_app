
import '../../../../core/api/api_result.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<Result<User?>> invoke(
      {required String email, required String newPassword}) {
    return authRepository.resetPassword(email: email, newPassword: newPassword);
  }
}
