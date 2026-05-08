import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mt5_leeon1/features/news/data/data_source/api/news_remote_data_source.dart';
import 'package:mt5_leeon1/features/news/data/data_source/impl/news_remote_data_source_impl.dart';
import 'package:mt5_leeon1/features/news/data/repo_impl/news_repo_impl.dart';
import 'package:mt5_leeon1/features/news/domain/bloc/news_bloc.dart';
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt=GetIt.instance;
Future<void> setupServiceLocator()async{
  getIt.registerSingleton<Talker>((TalkerFlutter.init()));
  getIt.registerLazySingleton<Dio>((){
    final dio=Dio(
        BaseOptions(baseUrl: 'https://newsapi.org/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )
    );
    dio.interceptors.add(TalkerDioLogger(talker: getIt<Talker>(),
    settings: TalkerDioLoggerSettings(
      printRequestData: true,
      printRequestHeaders: false,
      printResponseData: true,
      printResponseMessage: true,
      printResponseHeaders: true,
      printResponseTime: true,
      hiddenHeaders: {'X-Api-key'},

    )));
    return dio;
  });
  getIt.registerLazySingleton<NewsRemoteDataSource>(
          ()=>NewsRemoteDataSourceImpl(dio: getIt<Dio>()));
  getIt.registerLazySingleton<NewsRepository>(
          ()=>NewsRepoImpl(newsRemoteDataSource:
          getIt<NewsRemoteDataSource>()));
  getIt.registerFactory(()=>NewsBloc(
      newsRepository: getIt<NewsRepository>()));
}