import 'package:envied/envied.dart';
import 'package:flutter_kamp_example/environment-lesson-01-march/utils/environments/app_environment.dart';
import 'package:flutter_kamp_example/environment-lesson-01-march/utils/environments/environment_field_keys.dart';

part 'test_environment.g.dart';

@Envied(
  name: 'TestEnvironment',
  path: 'environments/test.env',
  obfuscate: true,
)
final class TestEnvironment implements AppEnvironment {
  @EnviedField(varName: EnvironmentFieldKeys.acceptedPlatforms)
  final String _acceptedPlatforms = _TestEnvironment._acceptedPlatforms;

  @override
  List<String> get acceptedPlatforms => _acceptedPlatforms.split(',');

  @override
  @EnviedField(varName: EnvironmentFieldKeys.baseUrl)
  final String baseUrl = _TestEnvironment.baseUrl;

  @override
  @EnviedField(varName: EnvironmentFieldKeys.password)
  final String password = _TestEnvironment.password;
}
