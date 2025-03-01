import 'package:envied/envied.dart';
import 'package:flutter_kamp_example/environment-lesson-01-march/utils/environments/app_environment.dart';
import 'package:flutter_kamp_example/environment-lesson-01-march/utils/environments/environment_field_keys.dart';

part 'production_environment.g.dart';

@Envied(
  name: 'Environment',
  path: 'environments/production.env',
  obfuscate: true,
)
final class ProductionEnvironment implements AppEnvironment {
  @EnviedField(varName: EnvironmentFieldKeys.acceptedPlatforms)
  final String _acceptedPlatforms = _Environment._acceptedPlatforms;

  @override
  List<String> get acceptedPlatforms => _acceptedPlatforms.split(',');

  @override
  @EnviedField(varName: EnvironmentFieldKeys.baseUrl)
  final String baseUrl = _Environment.baseUrl;

  @override
  @EnviedField(varName: EnvironmentFieldKeys.password)
  final String password = _Environment.password;
}
