import 'dart:async';

import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/services/dependency_injection/dependency_injector.dart';
import 'package:get_it/get_it.dart' as get_it;

final class GetItDependencyInjector extends DependencyInjector {
  late final get_it.GetIt _injector;

  GetItDependencyInjector() {
    _injector = get_it.GetIt.instance;
  }

  @override
  T get<T extends Object>({param1, param2, String? instanceName, Type? type}) =>
      _injector.get<T>(
        param1: param1,
        param2: param2,
        instanceName: instanceName,
        type: type,
      );

  @override
  bool isRegistered<T extends Object>(
          {Object? instance, String? instanceName}) =>
      _injector.isRegistered<T>(
        instance: instance,
        instanceName: instanceName,
      );

  @override
  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _injector.registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  @override
  void registerLazySingleton<T extends Object>(FactoryFunc<T> factoryFunc,
      {String? instanceName,
      DisposingFunc<T>? dispose,
      bool useWeakReference = false}) {
    _injector.registerLazySingleton<T>(
      factoryFunc,
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  @override
  T registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  }) {
    return _injector.registerSingleton<T>(
      instance,
      instanceName: instanceName,
      signalsReady: signalsReady,
      dispose: dispose,
    );
  }

  @override
  Future<void> reset({bool dispose = true}) =>
      _injector.reset(dispose: dispose);

  @override
  FutureOr unregister<T extends Object>(
          {Object? instance,
          String? instanceName,
          FutureOr Function(T p1)? disposingFunction,
          bool ignoreReferenceCount = false}) =>
      _injector.unregister<T>(
        ignoreReferenceCount: ignoreReferenceCount,
        disposingFunction: disposingFunction,
        instance: instance,
        instanceName: instanceName,
      );
}
