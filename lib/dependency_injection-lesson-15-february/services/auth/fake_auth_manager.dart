import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/auth/auth_service.dart';

final class FakeAuthManager extends AuthService {
  @override
  Future<bool> login(String email, String password) {
    return Future.value(true);
  }

  @override
  Future<bool> register(String email, String password) {
    return Future.value(false);
  }
}
