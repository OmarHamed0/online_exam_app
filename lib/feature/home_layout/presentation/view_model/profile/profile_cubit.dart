import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/core/api/api_result.dart';
import 'package:online_exam/core/base/base_view_model.dart';
import 'package:online_exam/feature/home_layout/domain/entities/app_user_entity.dart';
import 'package:online_exam/feature/home_layout/domain/use_case/profile/get_profile_data_use_case.dart';
import 'package:online_exam/feature/home_layout/presentation/view_model/profile/profile_events.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends BaseViewModel<ProfileState> {
  final GetProfileDataUseCase _getProfileDataUseCase;
  ProfileCubit(this._getProfileDataUseCase) : super(ProfileInitial());

  void doAction(ProfileEvents profileEvents) {
    switch (profileEvents) {
      case GetProfileDataEvent():
        _getProfileData();
    }
  }

  void _getProfileData() async {
    emit(GetProfileDataLoadingState());
    var result = await _getProfileDataUseCase.invoke();
    switch (result) {
      case Success<AppUserEntity?>():
        emit(GetProfileDataSuccessState(appUserEntity: result.data));
      case Fail<AppUserEntity?>():
        emit(GetProfileDataErrorState(
            errorMassage: getErrorMassageFromException(result.exception)));
    }
  }
}
