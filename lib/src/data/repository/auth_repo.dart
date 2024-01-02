import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:lastmile/main.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/data/api/api_client.dart';
import 'package:lastmile/src/data/models/response_model.dart';

import '../api/global_services.dart';

final authRepositoryProvider = Provider((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthRepository(apiClient);
});

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<ResponseModel> signUp(body) async {
    print('Got here in auth repo');
    ResponseModel responseModel;
    Response response = await _apiClient.postData(AppConstants.SIGN_UP, body);

    if (response.statusCode == 201) {
      responseModel = ResponseModel('account created', true);
      return responseModel;
    }
    print("Here in repo" + jsonDecode(response.body).toString());
    var error = jsonDecode(response.body)['errors'].toString();

    //  print("Here in repo" + response.reasonPhrase.toString());
    return responseModel = ResponseModel(error, false);
  }

  Future<ResponseModel> signIn(body) async {
    print('Got here in auth repo');
    ResponseModel responseModel;
    Response response =
        await _apiClient.postData(AppConstants.LOGIN, jsonEncode(body));

    if (response.statusCode == 200) {
      String token = jsonDecode(response.body)['data']['token'];
      await GlobalService.sharedPreferencesManager.setAuthToken(value: token);
      print('token');
      print(token);
      responseModel = ResponseModel('logged in', true);
      return responseModel;
    }
    print(response.body);
    print("Here in repo" + jsonDecode(response.body).toString());
    var error = jsonDecode(response.body)['msg'].toString();
    print('error first');
    print(error);
    // var error2 = jsonDecode(response.body)['fields'];
    // print('error');
    // print(error2);
    if (jsonDecode(response.body)['msg'] ==
        'User not verified, please verify your account') {
      error = 'User not verified, please verify your account';
    } else if (jsonDecode(response.body)['msg'] == 'Invalid data sent') {
      error = jsonDecode(response.body)['fields'].toString();
      print('error here');
      print(error);
    }
    // else if (jsonDecode(response.body)['fields']){
    //   error = 'User not verified, please verify your account';
    // }

//  Here in repo{error: User not verified, please verify your account}
    //  print("Here in repo" + response.reasonPhrase.toString());
    return responseModel = ResponseModel(error, false);
  }

  Future<ResponseModel> verifyOtp(body) async {
    print('Got here in otp repo');
    ResponseModel responseModel;
    // Call signIn method in SharedPreferencesManager to get the token
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    // _apiClient.updateHeaders(authToken);
    Response response =
        await _apiClient.postData(AppConstants.VERIFY_CODE, jsonEncode(body));

    if (response.statusCode == 200) {
      responseModel = ResponseModel('User Verified', true);
      return responseModel;
    }
    print("Here in verify otp repo" + jsonDecode(response.body).toString());
    var error = jsonDecode(response.body)['errors'].toString();

    //  print("Here in repo" + response.reasonPhrase.toString());
    return responseModel = ResponseModel(error, false);
  }

  Future<ResponseModel> resendOTP(email) async {
    ResponseModel responseModel;
    // Call signIn method in SharedPreferencesManager to get the token
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    // _apiClient.updateHeaders(authToken);
    Response response =
        await _apiClient.postData(AppConstants.RESENDOTP, jsonEncode(email));
    if (response.statusCode == 200) {
      responseModel = ResponseModel("Code sent to your email", true);
      return responseModel;
    } else {
      var error = jsonDecode(response.body)['errors'].toString();
      responseModel = ResponseModel(error, false);
      return responseModel;
    }
  }

  Future<ResponseModel> forgotPassword(email) async {
    print('Got here in auth repo');
    ResponseModel responseModel;
    // Call signIn method in SharedPreferencesManager to get the token
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    // _apiClient.updateHeaders(authToken);
    Response response = await _apiClient.postData(
        AppConstants.FORGOTPASSWORD, jsonEncode(email));
    print('response');
    // print(response);
    print(response.body);
    if (response.statusCode == 200) {
      responseModel = ResponseModel("Code sent to your email", true);
      return responseModel;
    }
    print(response.body);
    print("Here in repo" + jsonDecode(response.body)['msg'].toString());
    var error = jsonDecode(response.body)['msg'].toString();
    var error2 = jsonDecode(response.body)['fields'];
    print('error');
    print(error2);
    if (jsonDecode(response.body)['msg'] ==
        'User not verified, please verify your account') {
      error = 'User not verified, please verify your account';
    } else if (jsonDecode(response.body)['msg'] == 'Invalid data sent') {
      error = error2.toString();
      print('error here');
      print(error);
    }

    //  print("Here in repo" + response.reasonPhrase.toString());
    return responseModel = ResponseModel(error, false);
  }

  Future<ResponseModel> resetPassword(body) async {
    print('Got here in auth repo');
    print(body);
    ResponseModel responseModel;
    // Call signIn method in SharedPreferencesManager to get the token
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    // _apiClient.updateHeaders(authToken);
    Response response = await _apiClient.postData(
        AppConstants.RESET_PASSWORD, jsonEncode(body));
    print('response');
    print(response);
    print(response.body);
    if (response.statusCode == 200) {
      responseModel = ResponseModel("Password Reset Successful", true);
      return responseModel;
    }
    print(response.body);
    print("Here in repo" + jsonDecode(response.body)['msg'].toString());
    var error = jsonDecode(response.body)['msg'].toString();
    var error2 = jsonDecode(response.body)['fields'];
    print('error');
    print(error2);
    if (jsonDecode(response.body)['msg'] ==
        'User not verified, please verify your account') {
      error = 'User not verified, please verify your account';
    } else if (jsonDecode(response.body)['msg'] == 'Invalid data sent') {
      error = error2.toString();
      print('error here');
      print(error);
    }

    //  print("Here in repo" + response.reasonPhrase.toString());
    return responseModel = ResponseModel(error, false);
  }

  Future<ResponseModel> resendPasswordOtp(email) async {
    print('Got here in auth repo');
    ResponseModel responseModel;
    // Call signIn method in SharedPreferencesManager to get the token
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    // _apiClient.updateHeaders(authToken);
    Response response = await _apiClient.postData(
        AppConstants.RESEND_PASSWORD_OTP, jsonEncode(email));
    print('response');
    print(response);
    print(response.body);
    if (response.statusCode == 200) {
      responseModel = ResponseModel("Code sent to your email", true);
      return responseModel;
    }
    print("Here in repo" + jsonDecode(response.body).toString());
    var error = jsonDecode(response.body)['errors'].toString();

    return responseModel = ResponseModel(error, false);
  }

  Future<ResponseModel> verifyForgotPasswordOtp(body) async {
    print('Got here in otp repo');
    ResponseModel responseModel;
    // Call signIn method in SharedPreferencesManager to get the token
    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    // _apiClient.updateHeaders(authToken);
    Response response =
        await _apiClient.postData(AppConstants.OTP, jsonEncode(body));

    if (response.statusCode == 200) {
      responseModel = ResponseModel('Otp Verified', true);
      return responseModel;
    }
    print("Here in verify otp repo" + jsonDecode(response.body).toString());
    var error = jsonDecode(response.body)['errors'].toString();

    //  print("Here in repo" + response.reasonPhrase.toString());
    return responseModel = ResponseModel(error, false);
  }

  Future<ResponseModel> getUserData() async {
    print('Got here in user repo');
    ResponseModel responseModel;

    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    // _apiClient.updateHeaders(authToken);
    Response response = await _apiClient.getData(AppConstants.GET_USER);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // List<dynamic> userDetails = responseBody['userDetails'];
      // await GlobalService.sharedPreferencesManager.saveUserDetails(userDetails);
      responseModel = ResponseModel('User info retrieved successfully', true);
      return responseModel;
    }
    print(
        "Here in verify get user repo" + jsonDecode(response.body).toString());
    var error = jsonDecode(response.body)['errors'].toString();

    //  print("Here in repo" + response.reasonPhrase.toString());
    return responseModel = ResponseModel(error, false);
  }

  Future<ResponseModel> getTerminals() async {
    print('Got here in user repo');
    ResponseModel responseModel;

    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    // _apiClient.updateHeaders(authToken);
    Response response = await _apiClient.getData(AppConstants.GET_TERMINALS);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      List<dynamic> terminals = responseBody['terminals'];
      await GlobalService.sharedPreferencesManager.saveTerminals(terminals);
      responseModel =
          ResponseModel('Terminals info retrieved successfully', true);
      return responseModel;
    }
    print(response.body);
    print("Here in repo" + jsonDecode(response.body)['msg'].toString());
    var error = jsonDecode(response.body)['msg'].toString();
    var error2 = jsonDecode(response.body)['fields'];
    print('error');
    print(error2);
    if (jsonDecode(response.body)['msg'] ==
        'User not verified, please verify your account') {
      error = 'User not verified, please verify your account';
    } else if (jsonDecode(response.body)['msg'] == 'Invalid data sent') {
      error = error2.toString();
      print('error here');
      print(error);
    }

    //  print("Here in repo" + response.reasonPhrase.toString());
    return responseModel = ResponseModel(error, false);
  }
}
