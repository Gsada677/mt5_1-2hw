import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mt5_leeon1/features/auth/data/data_source/domain/repo/auth_repository.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(const AuthInitial());

  final AuthRepository authRepository;

  Future<void> auth(String login, String password) async {
    emit(const AuthLoading());

    try {
      final isAuthorized = await authRepository.auth(login, password);

      if (isAuthorized) {
        emit(const AuthSuccess());
        return;
      }

      emit(const AuthFailure('Неверный логин или пароль'));
    } catch (_) {
      emit(const AuthFailure('Ошибка авторизации'));
    }
  }
}
