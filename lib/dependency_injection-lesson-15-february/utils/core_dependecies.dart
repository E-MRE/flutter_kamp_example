import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/auth/auth_service.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/dependency_injection/dependency_injection_service.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/dependency_injection/getit/getit_dependency_injection_manager.dart';

DependencyInjectionService get kDependencyService =>
    GetItDependencyInjectionManager.instance;

AuthService get kAuthService => kDependencyService.injector.get<AuthService>();

T getDependency<T extends Object>() => kDependencyService.injector.get<T>();
