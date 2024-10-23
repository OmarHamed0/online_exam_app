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
    gh.factory<_i863.AuthApiManger>(() => _i188.AuthApiMangerImpl());
    gh.factory<_i649.AuthRemoteDataSource>(() =>
        _i446.AuthRemoteDataSourceImpl(apiManger: gh<_i863.AuthApiManger>()));
    gh.factory<_i3.AuthRepository>(() => _i461.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i649.AuthRemoteDataSource>()));
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
    gh.factory<_i447.ForgetPasswordCubit>(() => _i447.ForgetPasswordCubit(
          gh<_i597.ForgetPasswordUseCase>(),
          gh<_i203.ResetPasswordUseCase>(),
          gh<_i226.VerifyResetCodeUseCase>(),
        ));
    gh.factory<_i122.RegisterCubit>(
        () => _i122.RegisterCubit(gh<_i253.RegisterUseCase>()));
    gh.factory<_i228.LoginCubit>(
        () => _i228.LoginCubit(gh<_i549.LoginUseCase>()));
    return this;
  }
}
