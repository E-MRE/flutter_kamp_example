import 'package:flutter/material.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/utils/core_dependecies.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/utils/mixins/custom_dependency_registration_mixin.dart';

final class AppStart with CustomDependencyRegistrationMixin {
  void initializeApp() {
    WidgetsFlutterBinding.ensureInitialized();
    //diğer initialize işlemleri

    kDependencyService.register(customInjections: customRegistration);
  }
}
