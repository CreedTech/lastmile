// import 'package:dio/dio.dart';
// import 'package:lastmile/src/core/core.dart';
// import 'package:lastmile/src/data/models/response_model.dart';

// abstract class AuthRemoteDataSource {
//   Future<ResponseModel> loginUser(Map<String, dynamic> requestBody);
// }

// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   final NetworkContainer http;

//   AuthRemoteDataSourceImpl({
//     required this.http,
//   });

//   @override
//   Future<ResponseModel> loginUser(Map<String, dynamic> requestBody) async {
//     print(requestBody);
//     ResponseModel responseModel;

//     try {
//       final response = await http.method(
//         path: "api/user/login",
//         methodType: MethodType.post,
//         data: requestBody, // Pass the request body here
//       );

//       print('response');
//       print(response);

//       if (response.statusCode == 200) {
//         print('response.data');
//         print(response.data);
//         responseModel = ResponseModel('logged in', true);
//         return responseModel;
//       } else {
//         print('response');
//         print(response);
//         throw DioError;
//       }
//     } catch (error) {
//       print('Error: $error');
//       // Handle error appropriately, e.g., log it or rethrow
//       throw DioError;
//     }
//   }
// }
