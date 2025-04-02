// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../feature/auth/data/api/auth_api_manger.dart' as _i863;
import '../feature/auth/data/api/auth_api_manger_impl.dart' as _i188;
import '../feature/auth/data/datasource/auth_remote_datasource/auth_remote_data_source.dart'
    as _i649;
import '../feature/auth/data/datasource/auth_remote_datasource/auth_remote_data_source_impl.dart'
    as _i446;
import '../feature/auth/data/repository/auth_repository_impl.dart' as _i461;
import '../feature/auth/domain/repository/auth_repository.dart' as _i3;
import '../feature/auth/domain/usecase/forget_password_use_case.dart' as _i597;
import '../feature/auth/domain/usecase/login_use_case.dart' as _i549;
import '../feature/auth/domain/usecase/register_use_case.dart' as _i253;
import '../feature/auth/domain/usecase/reset_password_use_case.dart' as _i203;
import '../feature/auth/domain/usecase/verify_reset_code_use_case.dart'
    as _i226;
import '../feature/auth/presentation/forget_password/view_model/forget_password_cubit.dart'
    as _i447;
import '../feature/auth/presentation/login/view_model/login_cubit.dart'
    as _i228;
import '../feature/auth/presentation/register/view_model/register/register_cubit.dart'
    as _i122;
import '../feature/home_layout/data/api/home_layout_api_manger.dart' as _i37;
import '../feature/home_layout/data/api/home_layout_api_manger_impl.dart'
    as _i323;
import '../feature/home_layout/data/data_source/explore/explore_offline_data_source/explore_offline_data_source.dart'
    as _i139;
import '../feature/home_layout/data/data_source/explore/explore_offline_data_source/explore_offline_data_source_impl.dart'
    as _i124;
import '../feature/home_layout/data/data_source/explore/explore_remote_data_source/explore_remote_data_source.dart'
    as _i298;
import '../feature/home_layout/data/data_source/explore/explore_remote_data_source/explore_remote_data_source_impl.dart'
    as _i514;
import '../feature/home_layout/data/data_source/profile/profile_remote_data_source/profile_remote_data_source.dart'
    as _i873;
import '../feature/home_layout/data/data_source/profile/profile_remote_data_source/profile_remote_data_source_impl.dart'
    as _i841;
import '../feature/home_layout/data/data_source/result/result_offline_data_source/result_offline_data_source.dart'
    as _i99;
import '../feature/home_layout/data/data_source/result/result_offline_data_source/result_offline_data_source_impl.dart'
    as _i1073;
import '../feature/home_layout/data/repository/explore_repository_impl.dart'
    as _i743;
import '../feature/home_layout/data/repository/profile_repository_impl.dart'
    as _i596;
import '../feature/home_layout/domain/repository/explore_repository.dart'
    as _i755;
import '../feature/home_layout/domain/repository/profile_repository.dart'
    as _i323;
import '../feature/home_layout/domain/repository/result_repository.dart'
    as _i930;
import '../feature/home_layout/domain/use_case/explore/check_question_use_case.dart'
    as _i35;
import '../feature/home_layout/domain/use_case/explore/get_all_exams_use_case.dart'
    as _i1054;
import '../feature/home_layout/domain/use_case/explore/get_all_questions_use_case.dart'
    as _i647;
import '../feature/home_layout/domain/use_case/explore/get_all_subject_use_case.dart'
    as _i417;
import '../feature/home_layout/domain/use_case/explore/get_exams_by_id.dart'
    as _i269;
import '../feature/home_layout/domain/use_case/profile/change_password_use_case.dart'
    as _i435;
import '../feature/home_layout/domain/use_case/profile/edit_profile_use_case.dart'
    as _i430;
import '../feature/home_layout/domain/use_case/profile/get_user_info_use_case.dart'
    as _i721;
import '../feature/home_layout/domain/use_case/result/submitExamUseCse.dart'
    as _i725;
import '../feature/home_layout/presentation/view_model/explore/check_questions_view_model/check_questions_cubit.dart'
    as _i59;
import '../feature/home_layout/presentation/view_model/explore/get_all_exams_view_model/get_all_exams_cubit.dart'
    as _i855;
import '../feature/home_layout/presentation/view_model/explore/get_all_questions_view_model/get_all_questions_cubite.dart'
    as _i673;
import '../feature/home_layout/presentation/view_model/explore/get_all_subjects_view_model/get_all_subjects_cubit.dart'
    as _i338;
import '../feature/home_layout/presentation/view_model/profile/profile/profile_cubit.dart'
    as _i798;
import '../feature/home_layout/presentation/view_model/profile/reset_password/reset_password_cubit.dart'
    as _i614;
import '../feature/home_layout/view/view_model/home_layout_cubit.dart' as _i15;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i15.MainHomeCubit>(() => _i15.MainHomeCubit());
    gh.factory<_i863.AuthApiManger>(() => _i188.AuthApiMangerImpl());
    gh.factory<_i139.ExploreOfflineDataSource>(
        () => _i124.ExploreOfflineDataSourceImpl());
    gh.factory<_i37.HomeLayoutApiManger>(() => _i323.HomeLayoutApiMangerImpl());
    gh.factory<_i269.GetAllExamsUseCase>(() => _i269.GetAllExamsUseCase(
        repository: gh<_i930.GetExamByIdRepository>()));
    gh.factory<_i298.ExploreRemoteDataSource>(() =>
        _i514.ExploreRemoteDataSourceImpl(
            apiManger: gh<_i37.HomeLayoutApiManger>()));
    gh.factory<_i649.AuthRemoteDataSource>(() =>
        _i446.AuthRemoteDataSourceImpl(apiManger: gh<_i863.AuthApiManger>()));
    gh.factory<_i99.ResultOfflineDataSource>(
        () => _i1073.ResultOfflineDataSourceImpl());
    gh.factory<_i755.ExploreRepository>(() => _i743.ExploreRepositoryImpl(
          exploreRemoteDataSource: gh<_i298.ExploreRemoteDataSource>(),
          exploreOfflineDataSource: gh<_i139.ExploreOfflineDataSource>(),
        ));
    gh.factory<_i3.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i649.AuthRemoteDataSource>()));
    gh.factory<_i873.ProfileRemoteDataSource>(() =>
        _i841.ProfileRemoteDataSourceImpl(
            homeLayoutApiManger: gh<_i37.HomeLayoutApiManger>()));
    gh.factory<_i35.CheckQuestionsUseCase>(() =>
        _i35.CheckQuestionsUseCase(repository: gh<_i755.ExploreRepository>()));
    gh.factory<_i1054.GetAllExamsUseCase>(() =>
        _i1054.GetAllExamsUseCase(repository: gh<_i755.ExploreRepository>()));
    gh.factory<_i647.GetAllQuestionsUseCase>(() => _i647.GetAllQuestionsUseCase(
        repository: gh<_i755.ExploreRepository>()));
    gh.factory<_i417.GetAllSubjectsUseCase>(() =>
        _i417.GetAllSubjectsUseCase(repository: gh<_i755.ExploreRepository>()));
    gh.factory<_i253.RegisterUseCase>(
        () => _i253.RegisterUseCase(authRepository: gh<_i3.AuthRepository>()));
    gh.factory<_i226.VerifyResetCodeUseCase>(() =>
        _i226.VerifyResetCodeUseCase(authRepository: gh<_i3.AuthRepository>()));
    gh.factory<_i597.ForgetPasswordUseCase>(
        () => _i597.ForgetPasswordUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i549.LoginUseCase>(
        () => _i549.LoginUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i203.ResetPasswordUseCase>(
        () => _i203.ResetPasswordUseCase(gh<_i3.AuthRepository>()));
    gh.factory<_i725.SubmitExamUseCase>(
        () => _i725.SubmitExamUseCase(gh<_i755.ExploreRepository>()));
    gh.factory<_i855.GetAllExamsCubit>(
        () => _i855.GetAllExamsCubit(useCase: gh<_i1054.GetAllExamsUseCase>()));
    gh.factory<_i323.ProfileRepository>(() => _i596.ProfileRepositoryImpl(
        profileRemoteDataSource: gh<_i873.ProfileRemoteDataSource>()));
    gh.factory<_i673.GetAllQuestionsCubit>(() => _i673.GetAllQuestionsCubit(
        useCase: gh<_i647.GetAllQuestionsUseCase>()));
    gh.factory<_i338.ExploreCubit>(
        () => _i338.ExploreCubit(useCase: gh<_i417.GetAllSubjectsUseCase>()));
    gh.singleton<_i721.GetUserInfoUseCase>(
        () => _i721.GetUserInfoUseCase(gh<_i323.ProfileRepository>()));
    gh.factory<_i435.ChangePasswordUseCase>(
        () => _i435.ChangePasswordUseCase(gh<_i323.ProfileRepository>()));
    gh.factory<_i430.EditProfileUseCase>(
        () => _i430.EditProfileUseCase(gh<_i323.ProfileRepository>()));
    gh.factory<_i59.CheckQuestionsCubit>(() =>
        _i59.CheckQuestionsCubit(useCase: gh<_i35.CheckQuestionsUseCase>()));
    gh.factory<_i447.ForgetPasswordCubit>(() => _i447.ForgetPasswordCubit(
          gh<_i597.ForgetPasswordUseCase>(),
          gh<_i203.ResetPasswordUseCase>(),
          gh<_i226.VerifyResetCodeUseCase>(),
        ));
    gh.factory<_i122.RegisterCubit>(
        () => _i122.RegisterCubit(gh<_i253.RegisterUseCase>()));
    gh.factory<_i228.LoginCubit>(
        () => _i228.LoginCubit(gh<_i549.LoginUseCase>()));
    gh.factory<_i798.ProfileCubit>(() => _i798.ProfileCubit(
          gh<_i721.GetUserInfoUseCase>(),
          gh<_i430.EditProfileUseCase>(),
        ));
    gh.factory<_i614.ResetPasswordCubit>(
        () => _i614.ResetPasswordCubit(gh<_i435.ChangePasswordUseCase>()));
    return this;
  }
}
