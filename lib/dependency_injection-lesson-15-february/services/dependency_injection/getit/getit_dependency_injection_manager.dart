import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/cache/hive_cache_manager.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/dependency_injection/dependency_injection_service.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/dependency_injection/getit/getit_dependency_injector.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/token/my_token_manager.dart';

final class GetItDependencyInjectionManager extends DependencyInjectionService {
  static GetItDependencyInjectionManager? _instance;
  static GetItDependencyInjectionManager get instance {
    _instance ??= GetItDependencyInjectionManager._init();
    return _instance!;
  }

  GetItDependencyInjectionManager._init()
      : super(injector: GetItDependencyInjector());

  @override
  void register({RegisterDependencyCallback? customInjections}) {
    if (!injector.isRegistered<TokenService>()) {
      injector.registerLazySingleton<TokenService>(() => MyTokenManager());
    }

    if (!injector.isRegistered<HiveCacheManager>()) {
      injector.registerSingleton<HiveCacheManager>(HiveCacheManager());
    }

    customInjections?.call(injector);
  }
}
