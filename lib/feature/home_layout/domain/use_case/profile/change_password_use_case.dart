import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api/api_result.dart';

import '../../../data/mdoel/request/change_password_request.dart';
import '../../entities/change_password_entity.dart';
import '../../repository/profile_repository.dart';


@injectable
class ChangePasswordUseCase {
  final ProfileRepository _profileRepository;
  ChangePasswordUseCase(this._profileRepository);

  Future<Result<ChangePasswordEntity>> invoke(
      ChangePasswordRequest changePasswordRequest) {
    return _profileRepository.changePassword(changePasswordRequest);
  }
}
