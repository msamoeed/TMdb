import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/api/api_endpoint.dart';
import '../services/api/api_service.dart';
import '../services/api/dio_service.dart';
import '../services/api/interceptors/api_interceptor.dart';
import '../services/api/interceptors/sentry_interceptor.dart';
import 'local/path_provider_service.dart';
import 'logger.dart';
import 'package:sentry_dio/sentry_dio.dart';

final GetIt locator = GetIt.instance;
final baseOptions = BaseOptions(
  baseUrl: ApiEndpoint.baseUrl,
);
final _dio = Dio(baseOptions);

final _cacheOptions = CacheOptions(
  store: HiveCacheStore(PathProviderService.path),
  policy: CachePolicy
      .refreshForceCache, // Bcz we force cache on-demand in repositories
  hitCacheOnErrorExcept: [],

  maxStale: const Duration(days: 30), // No of days cache is valid
  keyBuilder: (options) => options.path,
);

void initSentryInterceptor() {
  _dio.addSentry(failedRequestStatusCodes:SentryHttpClient.defaultFailedRequestStatusCodes,
      
   );
}

     


var _dioService = DioService(
  dioClient: _dio,
  globalCacheOptions: _cacheOptions,
  interceptors: [
    // Order of interceptors very important
    ApiInterceptor(),

    // LoggingInterceptor(),
    AwesomeDioInterceptor(
      // Disabling headers and timeout would minimize the logging output.
      // Optional, defaults to true
      logRequestTimeout: true,
      logRequestHeaders: false,
      logResponseHeaders: false,

      // Optional, defaults to the 'log' function in the 'dart:developer' package.
    ),
    DioCacheInterceptor(
      options: _cacheOptions,
    ),

    //DioFirebasePerformanceInterceptor
    SentryInterceptor(),
  ],
);

class LocatorInjector {
  static Future<void> setUpLocator() async {
    Logger log = getLogger('Locator Injector');
    log.d('Registering Navigation Service');
    locator.registerLazySingleton(() => NavigationService());
    log.d('Registering Dialog Service');
    locator.registerLazySingleton(() => DialogService());
    log.d('Registering Snackbar Service');
    locator.registerLazySingleton(() => SnackbarService());
    log.d('Registering API Service');
    locator.registerLazySingleton(() => ApiService(_dioService));
   
  }
}
