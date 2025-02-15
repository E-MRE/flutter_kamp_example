import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/auth/auth_service.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/views/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authService}) : super(const AuthInitial());

  final AuthService authService;

  Future<void> login(String email, String password) async {
    emit(const AuthLoading());

    final isSuccess = await authService.login(email, password);

    emit(
      isSuccess
          ? AuthSuccess(email: email)
          : const AuthError(message: 'User couldn\'t login!'),
    );
  }

  Future<void> register(String email, String password) async {
    emit(const AuthLoading());

    final isSuccess = await authService.register(email, password);

    if (isSuccess) {
      emit(AuthSuccess(email: email));
    } else {
      emit(const AuthError(message: 'User couldn\'t login!'));
    }
  }
}
