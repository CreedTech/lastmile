import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/data/api/api_client.dart';
// import 'package:lastmile/src/presentation/auth/login/bloc/login/login_cubit.dart';
// import 'package:lastmile/src/presentation/loading/bloc/loading/loading_cubit.dart';
// import 'package:lastmile/src/presentation/loading/loading_screen.dart';
// import 'src/injector.dart';
// import 'src/presentation/home/bloc/theme/theme_mode_bloc.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterSecureStorage storage = const FlutterSecureStorage();
  //
  // await storage.deleteAll();
  // await init();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  // late LoginCubit _loginBloc;
  // late LoadingCubit _loadingCubit;

  @override
  void initState() {
    super.initState();
    // _loginBloc = sl<LoginCubit>();
    // _loadingCubit = sl<LoadingCubit>();
  }

  @override
  void dispose() {
    // _loginBloc.close();
    // _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setUpScreenUtils(context);
    setStatusBar();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TAA CONNECT',
        theme: ligthTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        // builder: (c, w) {
        //   setUpScreenUtils(c);
        //   return MediaQuery(
        //     data: MediaQuery.of(c).copyWith(textScaleFactor: 1.0),
        //     child: ScrollConfiguration(
        //       behavior: MyBehavior(),
        //       child: w!,
        //     ),
        //   );
        // },
        navigatorKey: _navigatorKey,
        // scaffoldMessengerKey: NavigatorHelper().kscaffoldMessengerKey,
        initialRoute: root,
        onGenerateRoute: RouterGenerator().generate,
        onUnknownRoute: RouterGenerator.onUnknownRoute,
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
