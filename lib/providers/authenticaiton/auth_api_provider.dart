import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/api/api_service.dart';
import '../../core/locator.dart';
import '../../models/home/accounts_list.dart';
import '../../models/login/login_response.dart';
import '../../models/login/pre_login_campaigns.dart';
import '../../models/login/pre_login_token.dart';
import '../../models/onboarding/customer_type.dart';
import '../../services/api/api_endpoint.dart';

class AuthApiProviderService {
  final ApiService? _apiService = locator<ApiService>();

  //HomeScreen Apis
  Future<UserLogin?> loginUser(
      {required String? username, required String? password}) async {
    return await _apiService?.setData<UserLogin>(
        requiresAuthToken: true,
        data: {
          'UserName': username,
          'Password': password,
          "rememberMe": true,
          "loginOptions": {"isOfflineEnabled": false, "isSSOEnabled": true},
          "provider": "DbxUserLogin"
        },
        endpoint: ApiEndpoint.authentication(Authentication.USER_LOGIN),
        converter: (response) => UserLogin.fromJson(response.body));
  }

 
  

 

  

 
}

final authApiServiceProvider =
    Provider<AuthApiProviderService>((ref) => AuthApiProviderService());

final loginStateProvider = StateProvider((ref) => UserLogin());

final accountStateProvider = StateProvider((ref) => Accounts());