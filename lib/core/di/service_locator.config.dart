// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mt5_leeon1/core/di/service_locator.dart' as _i442;
import 'package:mt5_leeon1/core/services/secure_storage_service/secure_storage_service.dart'
    as _i754;
import 'package:mt5_leeon1/features/auth/data/data_source/api/auth_remote_data_source.dart'
    as _i299;
import 'package:mt5_leeon1/features/auth/data/data_source/impl/auth_remote_data_source_impl.dart'
    as _i204;
import 'package:mt5_leeon1/features/auth/data/data_source/domain/cubit/auth_cubit.dart'
    as _i620;
import 'package:mt5_leeon1/features/auth/data/data_source/domain/repo/auth_repository.dart'
    as _i36;
import 'package:mt5_leeon1/features/auth/repo_impl/auth_repo_impl.dart'
    as _i419;
import 'package:mt5_leeon1/features/news/data/data_source/api/news_remote_data_source.dart'
    as _i386;
import 'package:mt5_leeon1/features/news/data/data_source/impl/news_remote_data_source_impl.dart'
    as _i255;
import 'package:mt5_leeon1/features/news/data/repo_impl/news_repo_impl.dart'
    as _i374;
import 'package:mt5_leeon1/features/news/domain/bloc/news_bloc.dart' as _i845;
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart'
    as _i866;
import 'package:mt5_leeon1/features/news/domain/usecases/get_news_use_cases.dart'
    as _i785;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i558.FlutterSecureStorage>(
      () => appModule.flutterSecureStorage,
    );
    gh.singleton<_i207.Talker>(() => appModule.talker);
    gh.singleton<_i361.Dio>(
      () => appModule.newsDio(gh<_i207.Talker>()),
      instanceName: 'newsDio',
    );
    gh.singleton<_i754.SecureStorageService>(
      () => _i754.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i386.NewsRemoteDataSource>(
      () => _i255.NewsRemoteDataSourceImpl(
        dio: gh<_i361.Dio>(instanceName: 'newsDio'),
      ),
    );
    gh.lazySingleton<_i299.AuthRemoteDataSource>(
      () => _i204.AuthRemoteDataSourceImpl(
        gh<_i207.Talker>(),
        gh<_i754.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i866.NewsRepository>(
      () => _i374.NewsRepoImpl(
        newsRemoteDataSource: gh<_i386.NewsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i36.AuthRepository>(
      () => _i419.AuthRepoImpl(
        authRemoteDataSource: gh<_i299.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i620.AuthCubit>(
      () => _i620.AuthCubit(authRepository: gh<_i36.AuthRepository>()),
    );
    gh.factory<_i845.NewsBloc>(
      () => _i845.NewsBloc(newsRepository: gh<_i866.NewsRepository>()),
    );
    gh.factory<_i785.GetNewsUseCases>(
      () => _i785.GetNewsUseCases(newsRepository: gh<_i866.NewsRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i442.AppModule {}
