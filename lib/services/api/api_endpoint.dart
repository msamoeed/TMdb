// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';

import '../../core/config.dart';

// Config

/// A utility class for getting paths for API endpoints.
/// This class has no constructor and all methods are `static`.
@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  /// The base url of our REST API, to which all the requests will be sent.
  /// It is supplied at the time of building the apk or running the app:
  /// ```
  /// flutter build apk --debug --dart-define=BASE_URL=www.some_url.com
  /// ```
  /// OR
  /// ```
  /// flutter run --dart-define=BASE_URL=www.some_url.com
  /// ```
  static const baseUrl = Config.baseUrl;

  /// Returns the path for movies [endpoint].

  static String movies(Movies endpoint) {
    switch (endpoint) {
      case Movies.UPCOMING_MOVIES:
        return '/movie/upcoming';
      case Movies.MOVIE_GENRES:
        return '/genre/movie/list';  
      default:
        return '/movie/upcoming';
    }
  }
}

/// A collection of endpoints used for getting movies purposes.
enum Movies {
  /// An endpoint for today's usage requests.
  UPCOMING_MOVIES,
  MOVIE_GENRES
}
