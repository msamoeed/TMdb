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

  /// Returns the path for an authentication [endpoint].
  

  

  static String movies(Movies endpoint) {
    switch (endpoint) {
      case Movies.UPCOMING_MOVIES:
        return '/movie/upcoming';
      default :
         return '/movie/upcoming';

    }
  }

  

  
  
  /// Returns the path for a student [endpoint].
  ///
  /// Specify student [erp] to get the path for a specific student.
  ///
  /// Specify secondary [extendedResourceId] to get the path for a specific secondary resource.

}

/// A collection of endpoints used for authentication purposes.
enum Movies {
  /// An endpoint for today's usage requests.
  UPCOMING_MOVIES,

  
}




