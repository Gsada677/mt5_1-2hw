import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
abstract final class SecureStorageKeys {
  static const String accessToken= 'accessTokenKey';
  static const String refreshToken= 'refreshTokenKey';
}
@Singleton()
class SecureStorageService {
  const SecureStorageService(this.flutterSecureStorage);
  final FlutterSecureStorage flutterSecureStorage;
  Future<void>write(String data,String key)async{
    return await flutterSecureStorage.write(key: key, value: data);
  }
  Future<String?>read(String key)async{
    return await flutterSecureStorage.read(key: key);
  }
  Future<void>delete(String key)async{
    return await flutterSecureStorage.delete(key: key);
  }
  Future<void>deleteAll()async{
    return await flutterSecureStorage.deleteAll();
  }
}