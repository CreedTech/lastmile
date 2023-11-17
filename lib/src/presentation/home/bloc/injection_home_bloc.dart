import 'package:get_it/get_it.dart';
import 'package:lastmile/src/presentation/home/bloc/theme/theme_mode_bloc.dart';



class HomeBlocInjection {
  static void init({
    required GetIt sl,
  }) {
    sl.registerFactory(() => ThemeModeBloc(storage: sl()));
    // sl.registerFactory(
    //     () => CategoryNewsBloc(headlinesCase: sl(), recommendationCase: sl()));
    // sl.registerFactory(() => HomeNewsBloc(
    //     getTrendingCase: sl(), hotCase: sl(), recommendationCase: sl()));
  }
}
