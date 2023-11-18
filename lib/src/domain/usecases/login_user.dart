import 'package:dartz/dartz.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/core/success/success.dart';
import 'package:lastmile/src/domain/abstraction/auth_repository.dart';
import 'package:lastmile/src/domain/entities/login_request_params.dart';



class LoginUser extends UseCase<Success, LoginRequestParams> {
  final AuthRepository _authenticationRepository;

  LoginUser(this._authenticationRepository);

  @override
  Future<Either<Failure, Success>> call(LoginRequestParams params) async =>
      _authenticationRepository.loginUser(params.toJson());
}