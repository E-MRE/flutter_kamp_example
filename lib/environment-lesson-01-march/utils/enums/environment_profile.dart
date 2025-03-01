import 'package:flutter_kamp_example/environment-lesson-01-march/utils/environments/app_environment.dart';
import 'package:flutter_kamp_example/environment-lesson-01-march/utils/environments/production_environment.dart';
import 'package:flutter_kamp_example/environment-lesson-01-march/utils/environments/test_environment.dart';

enum EnvironmentProfile {
  prod,
  test,
}

extension EnvironmentProfileExtension on EnvironmentProfile {
  AppEnvironment toEnvironment() {
    switch (this) {
      case EnvironmentProfile.prod:
        return ProductionEnvironment();
      case EnvironmentProfile.test:
        return TestEnvironment();
    }
  }
}
