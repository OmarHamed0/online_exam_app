


import '../../../../core/api/api_result.dart';
import 'package:injectable/injectable.dart';

import '../repository/auth_repository.dart';

@injectable
class ForgetPasswordUseCase{
  AuthRepository authRepository;

  ForgetPasswordUseCase(this.authRepository);

  Future<Result<String?>>invoke({required String email}){
    return authRepository.forgetPassword(email: email);
  }
}