import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/presentation/auth/login/bloc/login/login_cubit.dart';
import 'package:lastmile/src/presentation/loading/bloc/loading/loading_cubit.dart';
import 'package:lastmile/src/presentation/loading/loading_screen.dart';
import 'src/injector.dart';
import 'src/presentation/home/bloc/theme/theme_mode_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterSecureStorage storage = const FlutterSecureStorage();
  //
  // await storage.deleteAll();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LoginCubit _loginBloc;
  late LoadingCubit _loadingCubit;

  @override
  void initState() {
    super.initState();
    _loginBloc = sl<LoginCubit>();
    _loadingCubit = sl<LoadingCubit>();
  }

  @override
  void dispose() {
    _loginBloc.close();
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setUpScreenUtils(context);
    setStatusBar();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>.value(value: _loginBloc),
        BlocProvider<LoadingCubit>.value(value: _loadingCubit),
        BlocProvider<ThemeModeBloc>(
          create: (_) => sl<ThemeModeBloc>()..add(const ReadThemeModeEvent()),
        ),
      ],
      child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (_, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TAA CONNECT',
            theme: ligthTheme,
            darkTheme: darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            
            builder: (context, child) {
              return LoadingScreen(
                screen: child!,
              );
            },
            // builder: (c, w) {
            //   setUpScreenUtils(c);
            //   return MediaQuery(
            //     data: MediaQuery.of(c).copyWith(textScaleFactor: 1.0),
            //     child: ScrollConfiguration(
            //       behavior: MyBehavior(),
            //       child: LoadingScreen(
            //         screen: w!,
            //       ),
            //     ),
            //   );
            // },
            navigatorKey: sl<NavigatorHelper>().kNavKey,
            scaffoldMessengerKey: sl<NavigatorHelper>().kscaffoldMessengerKey,
            initialRoute: root,
            onGenerateRoute: sl<RouterGenerator>().generate,
          );
        },
      ),
      // ),
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
