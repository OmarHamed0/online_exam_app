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
import '../feature/home_layout/data/data_source/result/result_remote_data_source/result_remote_data_source.dart'
    as _i410;
import '../feature/home_layout/data/data_source/result/result_remote_data_source/result_remote_data_source_impl.dart'
    as _i931;
import '../feature/home_layout/data/repository/explore_repository_impl.dart'
    as _i743;
import '../feature/home_layout/data/repository/profile_repository_impl.dart'
    as _i596;
import '../feature/home_layout/data/repository/result_repository_impl.dart'
    as _i610;
import '../feature/home_layout/domain/repository/explore_repository.dart'
    as _i755;
import '../feature/home_layout/domain/repository/profile_repository.dart'
    as _i323;
import '../feature/home_layout/domain/repository/result_repository.dart'
    as _i930;
import '../feature/home_layout/domain/use_case/profile/get_profile_data_use_case.dart'
    as _i712;
import '../feature/home_layout/presentation/view_model/profile/profile_cubit.dart'
    as _i394;
import '../feature/home_layout/presentation/view_model/result/profile_cubit.dart'
    as _i842;

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
    gh.factory<_i410.ResultRemoteDataSource>(
        () => _i931.ResultRemoteDataSourceImpl());
    gh.factory<_i863.AuthApiManger>(() => _i188.AuthApiMangerImpl());
    gh.factory<_i930.ResultRepository>(() => _i610.ResultRepositoryImpl());
    gh.factory<_i298.ExploreRemoteDataSource>(
        () => _i514.ExploreRemoteDataSourceImpl());
    gh.factory<_i139.ExploreOfflineDataSource>(
        () => _i124.ExploreOfflineDataSourceImpl());
    gh.factory<_i37.HomeLayoutApiManger>(() => _i323.HomeLayoutApiMangerImpl());
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
    gh.factory<_i323.ProfileRepository>(() => _i596.ProfileRepositoryImpl(
        profileRemoteDataSource: gh<_i873.ProfileRemoteDataSource>()));
    gh.factory<_i447.ForgetPasswordCubit>(() => _i447.ForgetPasswordCubit(
          gh<_i597.ForgetPasswordUseCase>(),
          gh<_i203.ResetPasswordUseCase>(),
          gh<_i226.VerifyResetCodeUseCase>(),
        ));
    gh.factory<_i122.RegisterCubit>(
        () => _i122.RegisterCubit(gh<_i253.RegisterUseCase>()));
    gh.factory<_i228.LoginCubit>(
        () => _i228.LoginCubit(gh<_i549.LoginUseCase>()));
    gh.factory<_i712.GetProfileDataUseCase>(() => _i712.GetProfileDataUseCase(
        profileRepository: gh<_i323.ProfileRepository>()));
    gh.factory<_i394.ProfileCubit>(
        () => _i394.ProfileCubit(gh<_i712.GetProfileDataUseCase>()));
    gh.factory<_i842.ProfileCubit>(
        () => _i842.ProfileCubit(gh<_i712.GetProfileDataUseCase>()));
    return this;
  }
}
