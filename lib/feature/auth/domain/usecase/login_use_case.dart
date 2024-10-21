

import '../../../../core/api/api_result.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);


  Future<Result<User?>>invoke({
    required String email,
    required String password,
  }){
    return authRepository.login(email: email, password: password);
  }
}