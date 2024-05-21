import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/app_error.dart';
import '../entities/user_entity.dart';
//
abstract class AuthenticationRepository {
  Future<Either<AppError, UserEntity>> login(Map<String, dynamic> params);
//
  Future<Either<AppError, UserEntity>> register(
      Map<String, dynamic> params);

  Future<Either<AppError, UserEntity?>> getUserLocal();

  Future<Either<AppError, void>> deleteUserLocal();

  Future<Either<AppError, void>> saveUserLocal(UserEntity params);

  Future<Either<AppError, void>> logout();
}
