import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/core.dart';

class NetworkingDI {
  static FutureOr<void> initializeDependencies() async {
    await KeyValueStorageBase.init();
    await PathProviderService.init();

    GetIt.I.registerFactory<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: FlavorConfig.instance.variables['baseUrl'] as String,
        ),
      ),
    );

    GetIt.I.registerFactory<CacheOptions>(
      () => CacheOptions(
        store: HiveCacheStore(PathProviderService.path),
        policy: CachePolicy.noCache,
        maxStale: const Duration(days: 30),
        keyBuilder: (options) => options.path,
      ),
    );

    GetIt.I.registerSingleton<KeyValueStorageService>(KeyValueStorageService());

    GetIt.I.registerSingleton<NetworkService>(
      NetworkService(
        dio: GetIt.I<Dio>(),
        interceptors: [
          // Order of interceptors very important
          AuthInterceptor(storage: GetIt.I<KeyValueStorageService>()),
          DioCacheInterceptor(options: GetIt.I<CacheOptions>()),
          if (kDebugMode) LoggingInterceptor(),
        ],
      ),
    );
  }
}
