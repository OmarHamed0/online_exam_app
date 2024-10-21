
import '../../../../core/api/api_result.dart';
import '../repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase
{
  final AuthRepository authRepository;
  VerifyResetCodeUseCase({required this.authRepository});


  Future<Result<String?>>invoke({required String resetCode}){
    return authRepository.verifyResetCode(resetCode: resetCode);
  }
}