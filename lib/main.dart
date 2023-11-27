import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/data/api/api_client.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_code_picker/country_code_picker.dart';
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
        supportedLocales: const [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
