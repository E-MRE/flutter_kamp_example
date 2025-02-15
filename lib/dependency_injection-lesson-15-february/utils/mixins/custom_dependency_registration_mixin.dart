import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/auth/auth_service.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/auth/facebook_auth_manager.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/auth/fake_auth_manager.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/dependency_injection/dependency_injector.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/utils/core_dependecies.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/utils/dependency_constants.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/views/cubit/auth_cubit.dart';

mixin CustomDependencyRegistrationMixin {
  void customRegistration(DependencyInjector injector) {
    if (DependencyConstants.isTest) {
      _registerTestDependencies(injector);
    } else {
      _registerProductDependencies(injector);
    }

    injector.registerFactory(() => AuthCubit(authService: kAuthService));
  }

  void _registerTestDependencies(DependencyInjector injector) {
    injector.registerFactory<AuthService>(() => FakeAuthManager());
  }

  void _registerProductDependencies(DependencyInjector injector) {
    injector.registerFactory<AuthService>(() => FacebookAuthManager());
  }
}
