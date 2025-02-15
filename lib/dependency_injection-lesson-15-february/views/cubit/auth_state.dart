abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  AuthSuccess({required this.email});

  final String email;
}

class AuthError extends AuthState {
  final String message;
  const AuthError({this.message = ''});
}
