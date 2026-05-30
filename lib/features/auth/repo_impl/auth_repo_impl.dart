import 'package:injectable/injectable.dart';
import 'package:mt5_leeon1/features/auth/data/data_source/api/auth_remote_data_source.dart';
import 'package:mt5_leeon1/features/auth/data/data_source/domain/repo/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<bool> auth(String login, String password) async {
    return await authRemoteDataSource.auth(login, password);
  }


}
