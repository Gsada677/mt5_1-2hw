import 'package:injectable/injectable.dart';
import 'package:mt5_leeon1/core/di/service_locator.dart';
import 'package:mt5_leeon1/core/services/secure_storage_service/secure_storage_service.dart';
import 'package:mt5_leeon1/features/auth/data/data_source/api/auth_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract final class _ApiPath {
  static const String authPath= 'api/auth';
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {


  const AuthRemoteDataSourceImpl(this.talker,  this.secureStorageService);
final Talker talker;
final SecureStorageService secureStorageService;
  @override
  Future<bool> auth(String login, String password) async{
    final dio=Dio(
        BaseOptions(baseUrl: 'https://geeks-flutter.free.beeceptor.com/',
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
    final response=await dio.post(_ApiPath.authPath,data: {'login':login,'password':password});
    if (response.statusCode==200 && response.data!=null) {
      final accessToken=response.data['access_token'];
      final refreshToken=response.data['refresh_token'];
      await secureStorageService.write(accessToken,SecureStorageKeys.accessToken );
      await secureStorageService.write(refreshToken,SecureStorageKeys.refreshToken );

      return true;
    }
    return false;
  }

}
