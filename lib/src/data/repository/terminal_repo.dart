import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
// import 'package:lastmile/main.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/data/api/api_client.dart';
import 'package:lastmile/src/data/models/response_model.dart';

import '../api/global_services.dart';

final appRepositoryProvider = Provider((ref) {
  // final apiClient = ref.read(apiClientProvider);
  return AppRepository();
});

class AppRepository {

  AppRepository();

  static Future<ResponseModel> getTerminals() async {
    print('Got here in user repo');
    ResponseModel responseModel;

    String authToken =
        await GlobalService.sharedPreferencesManager.getAuthToken();
    print('authToken');
    print(authToken);

    // Update the headers in ApiClient with the obtained token
    ApiClient().updateHeaders(authToken);
    Response response = await ApiClient().getData(AppConstants.GET_TERMINALS);
    print('status');
    print(response.statusCode);
    print('response.body');
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print('responseBody');
      print(responseBody);
      dynamic terminals = responseBody['data'];
      await GlobalService.sharedPreferencesManager.saveTerminals(terminals);
      responseModel =
          ResponseModel('Terminals info retrieved successfully', true);
      return responseModel;
    }
    print('error here here');
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
