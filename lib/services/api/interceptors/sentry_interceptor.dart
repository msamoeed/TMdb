import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';

class SentryInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Sentry.addBreadcrumb(
      Breadcrumb(
        type: 'http',
        category: 'http',
        data: {
          'url': response.requestOptions.uri.toString(),
          'method': response.requestOptions.method,
          'status_code': response.statusCode,
        },
      ),
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Sentry.addBreadcrumb(
      Breadcrumb(
        type: 'http',
        category: 'http',
        data: {
          'url': err.requestOptions.uri.toString(),
          'method': err.requestOptions.method,
          'status_code': err.response?.statusCode ?? "NA",
        },
        message: DioErrorHandler.dioErrorToString(err),
      ),
    );
    super.onError(err, handler);
  }
}

class DioErrorHandler {
  static String dioErrorToString(DioError dioError) {
    String errorText;
    switch (dioError.type) {
      case DioErrorType.connectionError:
        errorText = "Connection Error";
        break;

      case DioErrorType.badCertificate:
        errorText = "Bad certificate";
        break;

      case DioErrorType.connectionTimeout:
        errorText =
            "Connection Timeout. Check your Internet connection or contact Server adiministrator";
        break;
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        errorText =
            "Connection lost, please check your internet connection and try again.";
        break;
      case DioErrorType.badResponse:
        errorText = _errorBaseOnHttpStatusCode(dioError);
        break;
      case DioErrorType.unknown:
        errorText =
            "Connection lost, please check your internet connection and try again.";
        break;
      case DioErrorType.cancel:
        errorText =
            "Connection lost, please check your internet connection and try again.";
        break;
    }
    return errorText;
  }

  static String _errorBaseOnHttpStatusCode(DioError dioError) {
    String errorText;
    if (dioError.response != null) {
      if (dioError.response?.statusCode == 401) {
        errorText =
            "Something went wrong, please close the app and login again.";
      } else if (dioError.response?.statusCode == 404) {
        errorText =
            "Connection lost, please check your internet connection and try again.";
      } else if (dioError.response?.statusCode == 500) {
        errorText =
            "We couldn't connect to the product server. Please contact Server adiminstrator";
      } else {
        errorText =
            "Something went wrong, please close the app and login again. If the issue persists contact Server adiminstrator";
      }
    } else {
      errorText =
          "Something went wrong, please close the app and login again. If the issue persists contact Server adiminstrator";
    }

    return errorText;
  }
}
