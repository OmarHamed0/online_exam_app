import '../../../../core/api/api_result.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Result<User?>> invoke(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepository.register(
      email: email,
      username: username,
      firstName: firstName,
      lastName: lastName,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
