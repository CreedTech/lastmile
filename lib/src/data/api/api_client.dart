import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:lastmile/src/core/core.dart';

class ApiClient {
  String? appBaseUrl = AppConstants.BASE_URL;
  late Map<String, String> _mainHeaders;
  String token = "";

  ApiClient() {
    // Initialize headers without the token
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
  }

  // Update headers with the token
  void updateHeaders(String newToken) {
    token = newToken;
    _mainHeaders['Authorization'] = 'Inherit from auth';
  }
/**  Method to send data to backend, don't edit this code  **/

  Future<http.Response> postData(String url, body) async {
    print('got to api client');
    print(url);
    print(body);

    try {
      final response = await http
          .post(
            Uri.parse(AppConstants.BASE_URL + url),
            // headers: _mainHeaders,
            headers: {
              'Content-type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              'Authorization': 'Inherit from auth',
            },
            body: body,
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Request was successful, return the response
        print('success');
        print(jsonDecode(response.body).toString());
        return response;
      } else {
        // Request failed with a non-2XX status code
        http.Response('Error: ${response.reasonPhrase}', response.statusCode);
        print('error');
        print(
            'Error: ${response.reasonPhrase}' + response.statusCode.toString());
        print('Failed with non 2XX status code  ' +
            jsonDecode(response.body).toString());

        return response;
      }
    } on TimeoutException {
      return http.Response('Network Timeout', 500);
    } on http.ClientException catch (e) {
      return http.Response('HTTP Client Exception: $e', 500);
    } catch (e) {
      // Handle any other exceptions here
      var resp = http.Response('Error: $e', 504);
      print(e);
      print('Other exception  ' + resp.reasonPhrase.toString());

      return resp;
    }
  }

//   Future<http.Response> postFormData(String url, body) async {
//   print('got to api client');

//   try {
//     Dio dio = Dio();
//     dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
//     dio.options.headers['Accept'] = 'application/json';
//     dio.options.headers['Authorization'] = 'Bearer $token';

//     FormData formData = FormData.fromMap(body);

//     final response = await dio
//         .post(
//           AppConstants.BASE_URL + url,
//           data: formData,
//           options: Options(
//             responseType: ResponseType.json,
//             receiveDataWhenStatusError: true,
//           ),
//         )
//         .timeout(const Duration(seconds: 30));

//     if (response.statusCode == 201 || response.statusCode == 200) {
//       // Request was successful, return the response
//       print(jsonDecode(response.data).toString());
//       return response;
//     } else {
//       // Request failed with a non-2XX status code
//       print('Failed with non 2XX status code  ' + response.data.toString());
//       return http.Response(response.data.toString(), response.statusCode);
//     }
//   } on TimeoutException {
//     return http.Response('Network Timeout', 500);
//   } on DioError catch (e) {
//     return http.Response('Dio Error: ${e.message}', 500);
//   } catch (e) {
//     // Handle any other exceptions here
//     var resp = http.Response('Error: $e', 504);
//     print('Other exception  ' + resp.reasonPhrase.toString());

//     return resp;
//   }
// }

/*  Method to update data to backend  **/
  Future putData(url, body) async {
    //print("This is body" + body);
    print('This is token' + token);
    http.Response response;
    try {
      response = await http
          .put(Uri.parse(AppConstants.BASE_URL + url),
              body: body, headers: _mainHeaders)
          .timeout(const Duration(seconds: 30));
    } on TimeoutException {
      response = http.Response("Network Time out", 200);
    } catch (e) {
      print(e.toString());

      response = http.Response(e.toString(), 504);
    }
    return response;
    //var response = await http.put(url, body: body, headers: _mainHeaders);
  }

/*  Method to accept data from backend  **/
  Future getData(url) async {
    print('got to api client');
    try {
      final response = await http.get(Uri.parse(AppConstants.BASE_URL + url),
          headers: _mainHeaders);

      if (response.statusCode == 200) {
        // Request was successful, return the response
        print(jsonDecode(response.body).toString());
        return response;
      } else {
        // Request failed with a non-2XX status code
        http.Response('Error: ${response.reasonPhrase}', response.statusCode);
        print('Failed with non 2XX status code  ' +
            jsonDecode(response.body).toString());

        return response;
      }
    } on TimeoutException {
      return http.Response('Network Timeout', 500);
    } on http.ClientException catch (e) {
      return http.Response('HTTP Client Exception: $e', 500);
    } catch (e) {
      print('e');
      print(e);
      // Handle any other exceptions here
      var resp = http.Response('Error: $e', 504);
      print('Other exception  ' + resp.reasonPhrase.toString());

      return resp;
    }

    // Response response = await get(url, headers: _mainHeaders);
    // return response;
  }

/*  Method to send photo to backend  **/
  Future postPhoto(String url, String imagePath) async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'text/plain',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL + url));
    request.fields.addAll({'URL': url});
    request.files
        .add(await http.MultipartFile.fromPath('profilePhoto', imagePath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
