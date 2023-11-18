import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/core/success/success.dart';
import 'package:lastmile/src/domain/entities/app_error.dart';
import 'package:lastmile/src/domain/entities/login_request_params.dart';
import 'package:lastmile/src/domain/usecases/login_user.dart';
// import 'package:lastmile/src/domain/usecases/login_user.dart';
import 'package:lastmile/src/presentation/loading/bloc/loading/loading_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  final LoadingCubit loadingCubit;
  LoginCubit({
    required this.loginUser,
    // required this.logoutUser,
    required this.loadingCubit,
  }) : super(LoginInitial());

  void initiateLogin(String email, String password) async {
    loadingCubit.show();
    // emit(state.copyWith(status: LoginBlocStatus.loading));
    final Either<Failure, Success> eitherResponse = await loginUser(
      LoginRequestParams(email: email, password: password),
    );
    print(eitherResponse);
    print(password);

    emit(eitherResponse.fold(
      (l) {
        var message = Guide.failureToMessage(l);
        print('message');
        print(message);
        return LoginError(message);
      },
      (r) => LoginSuccess(),
    ));
    loadingCubit.hide();
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return 'No Network';
      case AppErrorType.api:
      case AppErrorType.database:
        return 'Something went Wrong!!';
      case AppErrorType.sessionDenied:
        return 'Session Denied';
      default:
        return 'Incorrect Credentials';
    }
  }
}
