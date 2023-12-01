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
  

  

  static String authentication(Authentication endpoint) {
    switch (endpoint) {
      case Authentication.USER_LOGIN:
        return '/authService/100000002/login';
       case Authentication.GET_PRELOGIN_CAMPAIGNS:
        return '/services/data/v1/CampaignEngine/operations/Campaigns/getPreLoginCampaigns'; 
      case Authentication.VERIFY_LOGIN_OTP:
        return '/services/data/v1/Login/operations/Users_2/verifyLoginMFAOTP';
      case Authentication.POST_LOGIN_USERPROFILE:
        return '/authService/100000002/login/mfa';
      case Authentication.CAPTCHA:
        return '/services/data/v1/Login/operations/Security/generateCaptcha';  
    }
  }

   static String holding(Holding endpoint) {
    switch (endpoint) {
      case Holding.GET_ACCOUNTS_LIST:
        return '/services/data/v1/Holdings/operations/DigitalArrangements/getList';
       
    }
  }

  static String onboarding(Onboaridng endpoint) {
    switch (endpoint) {
      case Onboaridng.GET_CUSTOMER_TYPE:
        return '/services/SelfOnboardingJavaServices/getCustTypes';
       
    }
  }
  
  /// Returns the path for a student [endpoint].
  ///
  /// Specify student [erp] to get the path for a specific student.
  ///
  /// Specify secondary [extendedResourceId] to get the path for a specific secondary resource.

}

/// A collection of endpoints used for authentication purposes.
enum DailyData {
  /// An endpoint for today's usage requests.
  USAGE_TODAY_KWH,

  /// An endpoint for today's eletricity cost requests.
  COST_TODAY,

  /// An endpoint for last known wattage requests.
  LAST_KNOWN_WATTAGE,

  /// An endpoint for change password requests.
  BILL_THIS_MONTH,

  USAGE_TODAY_GRAPH,

  // An endpoint for fetching daily usage goal
  DAILY_GOAL
}

enum Core {
  /// An endpoint for today's usage requests.
  GET_BILLING_COMPANY,
  SAVE_USER_TERRIF
}

enum Authentication { 
  /// An endpoint for today's usage requests.
  USER_LOGIN,
  GET_PRELOGIN_CAMPAIGNS,
  VERIFY_LOGIN_OTP,
  POST_LOGIN_USERPROFILE,
  CAPTCHA,

 }

 enum Holding {
  GET_ACCOUNTS_LIST
 }

 enum Onboaridng {
  GET_CUSTOMER_TYPE
 }
