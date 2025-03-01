import 'package:flutter/material.dart';
import 'package:flutter_kamp_example/environment-lesson-01-march/utils/constants/app_environment_constants.dart';

final class EnvironmentExamplePage extends StatefulWidget {
  const EnvironmentExamplePage({super.key});

  @override
  State<EnvironmentExamplePage> createState() => _EnvironmentExamplePageState();
}

class _EnvironmentExamplePageState extends State<EnvironmentExamplePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Environment Example Page'),
              const SizedBox(height: 16),
              Text('URL: ${AppEnvironmentConstants.environment.baseUrl}'),
              const SizedBox(height: 16),
              Text('PASSWORD: ${AppEnvironmentConstants.environment.password}'),
              const SizedBox(height: 16),
              Text(
                  'PLATFORMS: ${AppEnvironmentConstants.environment.acceptedPlatforms}'),
              const SizedBox(height: 16),
              Text('Is Test: ${AppEnvironmentConstants.isTest}'),
            ],
          ),
        ),
      ),
    );
  }
}
