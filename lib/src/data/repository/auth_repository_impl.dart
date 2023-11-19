// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:lastmile/src/core/core.dart';
// import 'package:lastmile/src/core/success/success.dart';
// import 'package:lastmile/src/data/datasource/auth/authentication_remote_data_source.dart';
// import 'package:lastmile/src/domain/abstraction/auth_repository.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteSource;
//   final NetworkChecher network;

//   AuthRepositoryImpl(this.remoteSource, this.network);

//   @override
//   Future<Either<Failure, Success>> loginUser(Map<String, dynamic> body) async {
//     if (await network.isConnected) {
//       try {
//         final remote = await remoteSource.loginUser(body);
//         print('remote');
//         print(remote);
//         // await localSource.cacheRecommendation(remote);
//         return Right(Succesful(message: 'Login Successful'));
//       } on DioError catch (e) {
//         print('e here 1');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print(e);
//         if (e.type == DioErrorType.response) {
//           // Handle DioError with response (e.g., 4xx, 5xx errors)
//           print('e here2');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print(e);
//           return Left(
//             NetworkFailure(
//               responseException: ResponseException.getDioException(e),
//             ),
//           );
//         } else if (e.type == DioErrorType.sendTimeout) {
//           // Handle timeout error
//           print('e here3');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print('e');
//           print(e);
//           return Left(
//             NetworkFailure(
//               responseException: ResponseException.error(
//                 type: EResponseException.NOINTERNETCONNECTION,
//               ),
//             ),
//           );
//         } else {
//           // Handle other DioError types
//           return Left(
//             NetworkFailure(
//               responseException: ResponseException.getDioException(e),
//             ),
//           );
//         }
//       } catch (e) {
//         // Handle other non-Dio errors
//         print('e here4');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print('e');
//         print(e);
//         return Left(
//           NetworkFailure(
//             responseException: ResponseException.getDioException(e),
//           ),
//         );
//       }
//     } else {
//       return Left(
//         NetworkFailure(
//           responseException: ResponseException.error(
//             type: EResponseException.NOINTERNETCONNECTION,
//           ),
//         ),
//       );
//     }
//   }
// }
