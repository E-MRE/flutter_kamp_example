import 'package:flutter_kamp_example/environment-lesson-01-march/utils/enums/environment_profile.dart';
import 'package:flutter_kamp_example/environment-lesson-01-march/utils/environments/app_environment.dart';

final class AppEnvironmentConstants {
  static const EnvironmentProfile environmentProfile = EnvironmentProfile.test;
  static AppEnvironment get environment => environmentProfile.toEnvironment();

  static bool get isTest => environmentProfile == EnvironmentProfile.test;
}
