import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

/// A class that holds intercepting logic for API related requests. This is
/// the first interceptor in case of both request and response.
///
/// Primary purpose is to handle token injection and response success validation
///
/// Since this interceptor isn't responsible for error handling, if an exception
/// occurs it is passed on the next [Interceptor] or to [Dio].
class ApiInterceptor extends Interceptor {
 

  ApiInterceptor() : super();

  /// This method intercepts an out-going request before it reaches the
  /// destination.
  ///
  /// [options] contains http request information and configuration.
  /// [handler] is used to forward, resolve, or reject requests.
  ///
  /// This method is used to inject any token/API keys in the request.
  ///
  /// The [RequestInterceptorHandler] in each method controls the what will
  /// happen to the intercepted request. It has 3 possible options:
  ///
  /// - [handler.next]/[super.onRequest], if you want to forward the request.
  /// - [handler.resolve]/[super.onResponse], if you want to resolve the
  /// request with your custom [Response]. All ** request ** interceptors are ignored.
  /// - [handler.reject]/[super.onError], if you want to fail the request
  /// with your custom [DioError].
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    
      if (options.extra['requiresAuthToken']) {
       
        
        options.headers.addAll(
          <String, String>{ 
          'X-Kony-App-Key' : "9925d48950582f2b6d9cb8f9cb76a30a",
          'X-Kony-App-Secret' : "d5faed9d1467a6613c48b097f37f2cfb",
          'X-Kony-ReportingParams' : "%7B%22os%22:%22111.0.0.0%22,%22dm%22:%22%22,%22did%22:%225398B2F2-D92A-4679-8D08-C4B1E16F1C84%22,%22ua%22:%22Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_15_7)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/111.0.0.0%20Safari/537.36%22,%22aid%22:%22OnlineBanking%22,%22aname%22:%22OnlineBanking%22,%22chnl%22:%22desktop%22,%22plat%22:%22web%22,%22aver%22:%221.0.0%22,%22atype%22:%22spa%22,%22stype%22:%22b2c%22,%22kuid%22:%22dbpolbuser%22,%22mfaid%22:%226a5c1c83-914d-4e4f-9d5d-c44a5ed377a0%22,%22mfbaseid%22:%22e2f3312f-639b-40c3-aece-1fc4bbd2c50b%22,%22mfaname%22:%22DigitalBanking-Composite%22,%22sdkversion%22:%229.5.13%22,%22sdktype%22:%22js%22,%22fid%22:%22frmLogin%22,%22sessiontype%22:%22I%22,%22clientUUID%22:%221675424447882-96c1-f8d3-1ea0%22,%22rsid%22:%221679559107870-b562-8876-e58c%22,%22svcid%22:%22login_DbxUserLogin%22%7D",
          'Content-Type' : 'application/x-www-form-urlencoded'
          },
        );
      }
      else if (options.extra['requiresAuthorization'] ){
        print("hit");
        String? token = GetStorage().read('preLoginToken');
         options.headers.addAll(
          <String, String>{ 
          'X-Kony-Authorization' : token!,
          'Content-Type' : 'application/json',
          'X-Kony-ReportingParams' : "%7B%22os%22:%22111.0.0.0%22,%22dm%22:%22%22,%22did%22:%225398B2F2-D92A-4679-8D08-C4B1E16F1C84%22,%22ua%22:%22Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_15_7)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/111.0.0.0%20Safari/537.36%22,%22aid%22:%22OnlineBanking%22,%22aname%22:%22OnlineBanking%22,%22chnl%22:%22desktop%22,%22plat%22:%22web%22,%22aver%22:%221.0.0%22,%22atype%22:%22spa%22,%22stype%22:%22b2c%22,%22kuid%22:%22dbpolbuser%22,%22mfaid%22:%226a5c1c83-914d-4e4f-9d5d-c44a5ed377a0%22,%22mfbaseid%22:%22e2f3312f-639b-40c3-aece-1fc4bbd2c50b%22,%22mfaname%22:%22DigitalBanking-Composite%22,%22sdkversion%22:%229.5.13%22,%22sdktype%22:%22js%22,%22fid%22:%22frmLogin%22,%22sessiontype%22:%22I%22,%22clientUUID%22:%221675424447882-96c1-f8d3-1ea0%22,%22rsid%22:%221679559107870-b562-8876-e58c%22,%22svcid%22:%22login_DbxUserLogin%22%7D",

          },
        );    
    }

    else if (options.extra['requiresBoth']){
         String? token = GetStorage().read('preLoginToken');
         options.headers.addAll(
          <String, String>{ 
          'X-Kony-Authorization' : token!,
          'X-Kony-App-Key' : "9925d48950582f2b6d9cb8f9cb76a30a",
          'X-Kony-App-Secret' : "d5faed9d1467a6613c48b097f37f2cfb",
          'Content-Type' : 'application/x-www-form-urlencoded',
          'X-Kony-ReportingParams' : "%7B%22os%22:%22111.0.0.0%22,%22dm%22:%22%22,%22did%22:%225398B2F2-D92A-4679-8D08-C4B1E16F1C84%22,%22ua%22:%22Mozilla/5.0%20(Macintosh;%20Intel%20Mac%20OS%20X%2010_15_7)%20AppleWebKit/537.36%20(KHTML,%20like%20Gecko)%20Chrome/111.0.0.0%20Safari/537.36%22,%22aid%22:%22OnlineBanking%22,%22aname%22:%22OnlineBanking%22,%22chnl%22:%22desktop%22,%22plat%22:%22web%22,%22aver%22:%221.0.0%22,%22atype%22:%22spa%22,%22stype%22:%22b2c%22,%22kuid%22:%22dbpolbuser%22,%22mfaid%22:%226a5c1c83-914d-4e4f-9d5d-c44a5ed377a0%22,%22mfbaseid%22:%22e2f3312f-639b-40c3-aece-1fc4bbd2c50b%22,%22mfaname%22:%22DigitalBanking-Composite%22,%22sdkversion%22:%229.5.13%22,%22sdktype%22:%22js%22,%22fid%22:%22frmLogin%22,%22sessiontype%22:%22I%22,%22clientUUID%22:%221675424447882-96c1-f8d3-1ea0%22,%22rsid%22:%221679559107870-b562-8876-e58c%22,%22svcid%22:%22login_DbxUserLogin%22%7D",

          },
        );    
    }

    return handler.next(options);
  
  }

  /// This method intercepts an incoming response before it reaches Dio.
  ///
  /// [response] contains http [Response] info.
  /// [handler] is used to forward, resolve, or reject responses.
  ///
  /// This method is used to check the success of the response by verifying
  /// its headers.
  ///
  /// If response is successful, it is simply passed on. It may again be
  /// intercepted if there are any after it. If none, it is passed to [Dio].
  ///
  /// Else if response indicates failure, a [DioError] is thrown with the
  /// response and original request's options.
  ///
  /// ** The success criteria is dependant on the API and may not always be
  /// the same. It might need changing according to your own API. **
  ///
  /// The [RequestInterceptorHandler] in each method controls the what will
  /// happen to the intercepted response. It has 3 possible options:
  ///
  /// - [handler.next]/[super.onRequest], if you want to forward the [Response].
  /// - [handler.resolve]/[super.onResponse], if you want to resolve the
  /// [Response] with your custom data. All ** response ** interceptors are ignored.
  /// - [handler.reject]/[super.onError], if you want to fail the response
  /// with your custom [DioError].
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final success = response.statusCode == 200;

    if (success) return handler.next(response);

    //Reject all error codes from server except 402 and 200 OK
    return handler.reject(
      DioError(
        requestOptions: response.requestOptions,
        response: response,
      ),
    );
  }
  }
