import 'package:dartz/dartz.dart';
import 'package:lastmile/src/core/core.dart';
import 'package:lastmile/src/core/success/success.dart';

abstract class AuthRepository {
  Future<Either<Failure, Success>> loginUser(Map<String, dynamic> params);
}
