// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:lastmile/src/core/core.dart';
// import 'package:lastmile/src/data/models/response_model.dart';
// import 'package:lastmile/src/domain/entities/login_request_params.dart';
// import 'package:lastmile/src/domain/usecases/login_user.dart';
// // import 'package:lastmile/src/domain/usecases/login_user.dart';
// import 'package:lastmile/src/presentation/auth/login/bloc/enum_login.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final LoginUser loginUser;
//    LoginBloc({
//     required this.loginUser,
//     // required this.logoutUser,
//     // required this.loadingCubit,
//   }) : super(const LoginState()){
//        on<LoginEvent>((event, emit) {});
//     on<LoginUserEvent>(_onLoginUserEventEvent);
//   }
//   void _onLoginUserEventEvent(
//       LoginUserEvent event, Emitter<LoginState> emit,String email, String password) async {
//     emit(state.copyWith(status: LoginBlocStatus.loading));
//     final data = ResponseModel();
//     await loginUser(LoginRequestParams()).then(
//       (value) => value.fold(
//         (l) => emit(
//           state.copyWith(
//             status: LoginBlocStatus.failure,
//             message: Guide.failureToMessage(l),
//           ),
//         ),
//         (r) => emit(
//           state.copyWith(
//             status: LoginBlocStatus.loaded,
//           ),
//         ),
//       ),
//     );
//     return;
//   }


// }
