import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/core.dart';

class NetworkingDI {
  static Future<void> initializeDependencies() async {
    await KeyValueStorageBase.init();
    await PathProviderService.init();

    final baseOptions = BaseOptions(
      baseUrl: SMobillsEndpoint.baseUrl,
    );

    final dio = Dio(baseOptions);

    final cacheOptions = CacheOptions(
      store: HiveCacheStore(PathProviderService.path),
      policy:
          CachePolicy.noCache, // Bcz we force cache on-demand in repositories
      maxStale: const Duration(days: 30), // No of days cache is valid
      keyBuilder: (options) => options.path,
    );

    GetIt.I.registerSingleton<KeyValueStorageService>(KeyValueStorageService());
    GetIt.I.registerSingleton<DioService>(
      DioService(
        dioClient: dio,
        globalCacheOptions: cacheOptions,
        interceptors: [
          // Order of interceptors very important
          AuthInterceptor(storage: GetIt.I<KeyValueStorageService>()),
          DioCacheInterceptor(options: cacheOptions),
          if (kDebugMode) LoggingInterceptor(),
        ],
      ),
    );

    GetIt.I.registerSingleton<SMobillsHTTPService>(
      SMobillsHTTPService(dioService: GetIt.I<DioService>()),
    );
  }
}
