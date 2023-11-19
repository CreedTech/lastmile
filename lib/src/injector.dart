// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:lastmile/src/core/core.dart';
// import 'package:lastmile/src/data/datasource/auth/authentication_local_data_source.dart';
// import 'package:lastmile/src/data/datasource/auth/authentication_remote_data_source.dart';
// import 'package:lastmile/src/data/repository/auth_repository_impl.dart';
// import 'package:lastmile/src/domain/abstraction/auth_repository.dart';
// import 'package:lastmile/src/domain/usecases/login_user.dart';
// import 'package:lastmile/src/presentation/auth/login/bloc/injection_login.dart';
// import 'package:lastmile/src/presentation/history/bloc/injection_history_bloc.dart';
// import 'package:lastmile/src/presentation/home/bloc/injection_home_bloc.dart';
// import 'package:lastmile/src/presentation/loading/bloc/injecttion_loading_bloc.dart';
// import 'package:lastmile/src/presentation/order/bloc/injection_order_bloc.dart';
// import 'package:lastmile/src/presentation/profile/bloc/injection_profile.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   //! Bloc

//   HomeBlocInjection.init(sl: sl);
//   HistoryBlocInjection.init(sl: sl);
//   OrderBlocInjection.init(sl: sl);
//   ProfileBlocInjection.init(sl: sl);
//   LoginBlocInjection.init(sl: sl);
//   LoadingBlocInjection.init(sl: sl);
//   // BookmarkBlocInjection.init(sl: sl);

//   //! Domain

//   /// Repositories
//   sl.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(
//       sl(),
//       sl(),
//       // sl(),
//     ),
//   );
//   // sl.registerLazySingleton<BookmarkRepository>(
//   //   () => BookmarkRepositoryImpl(
//   //     sl(),
//   //   ),
//   // );

//   /// Usecases
//   sl.registerLazySingleton(() => LoginUser(sl()));
//   // sl.registerLazySingleton(() => GetHotCase(sl()));
//   // sl.registerLazySingleton(() => GetRecommendationCase(sl()));
//   // sl.registerLazySingleton(() => GetHeadlinesCase(sl()));
//   // sl.registerLazySingleton(() => SearchNewsCase(sl()));

//   // sl.registerLazySingleton(() => AddBookmarkCase(sl()));
//   // sl.registerLazySingleton(() => GetBookmarkCase(sl()));
//   // sl.registerLazySingleton(() => RemoveBookmarkCase(sl()));

//   //! Data

//   /// Datasources
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSourceImpl(
//       http: sl(),
//     ),
//   );
//   sl.registerLazySingleton<AuthenticationLocalDataSource>(
//     () => AuthenticationLocalDataSourceImpl(
//         // storage: sl(),
//         ),
//   );
//   // sl.registerLazySingleton<BookmarkLocalDataSource>(
//   //   () => BookmarkLocalDataSourceImpl(
//   //     sl(),
//   //   ),
//   // );

//   //! Core
//   sl.registerLazySingleton<NetworkContainer>(
//       () => NetworkContainerImpl(dio: sl()));
//   sl.registerLazySingleton(() => NavigatorHelper());
//   sl.registerLazySingleton(() => RouterGenerator());
//   sl.registerLazySingleton(() => StorageHelper());
//   sl.registerLazySingleton<NetworkChecher>(() => (NetworkCheckerImpl()));

//   //! Plugins

//   sl.registerLazySingleton(
//     () => Dio(
//       BaseOptions(
//         baseUrl: rootUrl,
//         connectTimeout: 60 * 1000,
//         receiveTimeout: 60 * 1000,
//         receiveDataWhenStatusError: true,
//         contentType: "application/json",
//       ),
//     ),
//   );
// }
