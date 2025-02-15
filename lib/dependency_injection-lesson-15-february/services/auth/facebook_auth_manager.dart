import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/auth/auth_service.dart';

final class FacebookAuthManager extends AuthService {
  @override
  Future<bool> login(String email, String password) async {
    if (email.isEmpty) {
      return false;
    }

    if (password.isEmpty) {
      return false;
    }

    await Future.delayed(const Duration(seconds: 2));

    return true;
  }

  @override
  Future<bool> register(String email, String password) async {
    if (email.isEmpty) {
      return false;
    }

    if (password.isEmpty) {
      return false;
    }

    await Future.delayed(const Duration(seconds: 2));

    return true;
  }
}
