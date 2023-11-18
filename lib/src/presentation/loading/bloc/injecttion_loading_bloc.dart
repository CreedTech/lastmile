import 'package:get_it/get_it.dart';
import 'package:lastmile/src/presentation/loading/bloc/loading/loading_cubit.dart';



class LoadingBlocInjection {
  static void init({
    required GetIt sl,
  }) {
        sl.registerFactory(() => LoadingCubit());
  }
}
