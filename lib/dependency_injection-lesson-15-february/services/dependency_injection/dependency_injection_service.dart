import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/dependency_injection/dependency_injector.dart';

typedef RegisterDependencyCallback = void Function(DependencyInjector injector);

abstract class DependencyInjectionService {
  const DependencyInjectionService({required this.injector});

  final DependencyInjector injector;

  void register({RegisterDependencyCallback? customInjections});
}
