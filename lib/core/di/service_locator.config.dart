// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mt5_leeon1/core/di/service_locator.dart' as _i442;
import 'package:mt5_leeon1/features/news/data/data_source/api/news_remote_data_source.dart'
    as _i386;
import 'package:mt5_leeon1/features/news/data/data_source/impl/news_remote_data_source_impl.dart'
    as _i255;
import 'package:mt5_leeon1/features/news/data/repo_impl/news_repo_impl.dart'
    as _i374;
import 'package:mt5_leeon1/features/news/domain/bloc/news_bloc.dart' as _i845;
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart'
    as _i866;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i207.Talker>(() => appModule.talker);
    gh.singleton<_i361.Dio>(() => appModule.dio(gh<_i207.Talker>()));
    gh.lazySingleton<_i386.NewsRemoteDataSource>(
      () => _i255.NewsRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );

    gh.lazySingleton<_i866.NewsRepository>(
      () => _i374.NewsRepoImpl(
        newsRemoteDataSource: gh<_i386.NewsRemoteDataSource>(),
      ),
    );
    gh.factory<_i845.NewsBloc>(
      () => _i845.NewsBloc(newsRepository: gh<_i866.NewsRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i442.AppModule {}
