// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// import '../core.dart';

// enum MethodType { get, post }

// abstract class NetworkContainer {
//   Future<Response> method({
//     required String path,
//     required MethodType methodType,
//     dynamic data,
//   });
// }

// class NetworkContainerImpl implements NetworkContainer {
//   final Dio dio;
//   NetworkContainerImpl({required this.dio});
//   @override
//   Future<Response> method({
//     required String path,
//     required MethodType methodType,
//     data,
//   }) =>
//       _requestMethod(path: path, methodType: methodType);

//   Future<Response> _requestMethod({
//     required String path,
//     required MethodType methodType,
//     dynamic data,
//   }) async {
//     dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: false,
//         responseHeader: false,
//         error: true,
//         compact: true,
//         maxWidth: 90,
//       ),
//     );

//     try {
//       Response response;
//       if (methodType == MethodType.get) {
//         response = await dio.get(
//           rootUrl + path,
//           options: Options(
//             contentType: "application/json",
//           ),
//         );
//       } else {
//         response = await dio.post(
//           rootUrl + path,
//           options: Options(
//             contentType: "application/json",
//           ),
//           data: data,
//         );
//       }

//       print('Request Payload:');
//       print(data);

//       print('Response:');
//       print(response);

//       return response;
//     } catch (e) {
//       print('Error: $e');
//       throw e; // rethrow the error after logging
//     }
//   }
// }
