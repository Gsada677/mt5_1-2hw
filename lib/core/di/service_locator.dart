import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mt5_leeon1/core/di/service_locator.config.dart';
import 'package:mt5_leeon1/features/news/data/data_source/api/news_remote_data_source.dart';
import 'package:mt5_leeon1/features/news/data/data_source/impl/news_remote_data_source_impl.dart';
import 'package:mt5_leeon1/features/news/data/repo_impl/news_repo_impl.dart';
import 'package:mt5_leeon1/features/news/domain/bloc/news_bloc.dart';
import 'package:mt5_leeon1/features/news/domain/repo/news_repository.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

final getIt=GetIt.instance;
@injectableInit
Future<void> setupServiceLocator()async=>getIt.init();
@module
abstract class AppModule{
  @singleton
  FlutterSecureStorage get flutterSecureStorage=>FlutterSecureStorage();
  @singleton
  Talker get talker=>TalkerFlutter.init();
  @Named('newsDio')
  @singleton
  Dio newsDio(Talker talker){
  final dio=Dio(
      BaseOptions(baseUrl: 'https://newsapi.org/',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
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
}

}

