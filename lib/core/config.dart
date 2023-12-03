import 'package:flutter/foundation.dart';

/// A utility class that holds constants for exposing loaded
/// dart environment variables.
/// This class has no constructor and all variables are `static`.
@immutable
class Config {
  const Config._();

  /// The base url of our REST API, to which all the requests will be sent.
  /// It is supplied at the time of building the apk or running the app:
  /// ```
  /// flutter build apk --debug --dart-define=BASE_URL=www.some_url.com
  /// ```
  /// OR
  /// ```
  /// flutter run --dart-define=BASE_URL=www.some_url.com
  /// ```
  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://api.themoviedb.org/3',
  );

   static const imageUrl = String.fromEnvironment(
    'IMAGE_BASE_URL',
    defaultValue: 'https://image.tmdb.org/t/p/w500',
  );


  /// The client key for sentry SDK. The DSN tells the SDK where to
  /// send the events to.
  ///
  /// It is supplied at the time of building the apk or running the app:
  /// ```
  /// flutter build apk --debug --dart-define=SENTRY_DSN=www.some_url.com
  /// ```
  /// OR
  /// ```
  /// flutter run --dart-define=SENTRY_DSN=www.some_url.com
  /// ```
  static const sentryDSN = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue:
        'https://b21dc64d900049dea3d17c8f6ead8620@o1384418.ingest.sentry.io/6702824' +
            "123",
  );

  /// The apiKey for server api authentication.
  /// It is supplied at the time of building the apk or running the app:
  /// ```
  /// flutter build apk --debug --dart-define=API_KEY=some_key
  /// ```
  /// OR
  ///  ```
  /// flutter run --dart-define=API_KEY=some_key
  ///   ```
  static const apiKey = String.fromEnvironment(
    'API_KEY',
    defaultValue: 'b2a8a4430106b21ccac80bf526d7f899',
  );
}
