import 'dart:async';

/// Signature of the factory function used by non async factories
typedef FactoryFunc<T> = T Function();

/// Signature for disposing function
/// because closures like `(x){}` have a return type of Null we don't use `FutureOr<void>`
typedef DisposingFunc<T> = FutureOr Function(T param);

abstract class DependencyInjector {
  /// retrieves or creates an instance of a registered type [T] depending on the registration
  /// function used for this type or based on a name.
  /// for factories you can pass up to 2 parameters [param1,param2] they have to match the types
  /// given at registration with [registerFactoryParam()]
  /// [type] if you want to get an instance by a Type object instead of a generic parameter.This should
  /// rarely be needed but can be useful if you have a runtime type and want to get an instance
  T get<T extends Object>({
    dynamic param1,
    dynamic param2,
    String? instanceName,
    Type? type,
  });

  /// registers a type so that a new instance will be created on each call of [get] on that type
  /// [T] type to register
  /// [factoryFunc] factory function for this type
  /// [instanceName] if you provide a value here your factory gets registered with that
  /// name instead of a type. This should only be necessary if you need to register more
  /// than one instance of one type.
  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  });

  /// registers a type as Singleton by passing an [instance] of that type
  /// that will be returned on each call of [get] on that type
  /// [T] type to register
  /// The newly registered instance will also be returned.
  /// [instanceName] if you provide a value here your instance gets registered with that
  /// name instead of a type. This should only be necessary if you need to register more
  /// than one instance of one type.
  /// If [signalsReady] is set to `true` it means that the future you can get from `allReady()`
  /// cannot complete until this instance was signalled ready by calling
  /// [signalsReady(instance)].
  T registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  });

  /// registers a type as Singleton by passing a factory function that will be called
  /// on the first call of [get] on that type
  /// [T] type to register
  /// [factoryFunc] factory function for this type
  /// [instanceName] if you provide a value here your factory gets registered with that
  /// name instead of a type. This should only be necessary if you need to register more
  /// than one instance of one type.
  /// [registerLazySingleton] does not influence [allReady] however you can wait
  /// for and be dependent on a LazySingleton.
  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
    bool useWeakReference = false,
  });

  /// Tests if an [instance] of an object or aType [T] or a name [instanceName]
  /// is registered inside GetIt
  bool isRegistered<T extends Object>({Object? instance, String? instanceName});

  /// Clears all registered types in the reverse order in which they were registered.
  /// Handy when writing unit tests or when disposing services that depend on each other.
  /// If you provided dispose function when registering they will be called
  /// [dispose] if `false` it only resets without calling any dispose
  /// functions
  /// As dispose functions can be async, you should await this function.
  Future<void> reset({bool dispose = true});

  /// Unregister an [instance] of an object or a factory/singleton by Type [T] or by name
  /// [instanceName] if you need to dispose any resources you can do it using
  /// [disposingFunction] function that provides an instance of your class to be disposed.
  /// This function overrides the disposing you might have provided when registering.
  /// If you have enabled reference counting when registering, [unregister] will only unregister and dispose the object
  /// if referenceCount is 0
  /// [ignoreReferenceCount] if `true` it will ignore the reference count and unregister the object
  /// only use this if you know what you are doing
  FutureOr unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T)? disposingFunction,
    bool ignoreReferenceCount = false,
  });
}
