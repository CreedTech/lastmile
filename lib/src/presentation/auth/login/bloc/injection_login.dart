import 'package:get_it/get_it.dart';
import 'package:lastmile/src/presentation/auth/login/bloc/login/login_cubit.dart';

class LoginBlocInjection {
  static void init({
    required GetIt sl,
  }) {
    sl.registerFactory(() => LoginCubit(loginUser: sl(), loadingCubit: sl()));
  }
}
