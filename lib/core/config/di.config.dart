// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/api/client/rest_client_auth.dart' as _i428;
import '../../features/auth/api/data_source_impl/sign_in_remote_impl.dart'
    as _i332;
import '../../features/auth/data/data_source/sign_in_remote.dart' as _i541;
import '../../features/auth/data/repo/sign_in_repo_impl.dart' as _i872;
import '../../features/auth/domain/repo/sign_in_repo.dart' as _i444;
import '../../features/auth/domain/use_case/sign_in_use_case.dart' as _i847;
import '../../features/home/repos/home_repo.dart' as _i474;
import '../../features/home/repos/home_repo_impl.dart' as _i59;
import '../api_service/reset_client.dart' as _i737;
import '../module/dio_module/dio_module.dart' as _i630;

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
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dioProfile(),
      instanceName: 'auth',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(),
      instanceName: 'getProduct',
    );
    gh.factory<_i737.RestClient>(
        () => _i737.RestClient(gh<_i361.Dio>(instanceName: 'getProduct')));
    gh.factory<_i428.RestClientAuth>(
        () => _i428.RestClientAuth(gh<_i361.Dio>(instanceName: 'auth')));
    gh.factory<_i541.SignInRemote>(() =>
        _i332.SignInRemoteImpl(restClientAuth: gh<_i428.RestClientAuth>()));
    gh.singleton<_i474.HomeRepo>(
        () => _i59.HomeRepoImpl(resetApi: gh<_i737.RestClient>()));
    gh.factory<_i444.SignInRepoContract>(
        () => _i872.SignInRepoImpl(signInRemote: gh<_i541.SignInRemote>()));
    gh.factory<_i847.SignInUseCase>(() => _i847.SignInUseCase(
        signInRepoContract: gh<_i444.SignInRepoContract>()));
    return this;
  }
}

class _$DioModule extends _i630.DioModule {}
