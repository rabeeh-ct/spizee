import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/app_error.dart';
//
abstract class AuthenticationRepository {

  Future<Either<AppError, void>> logout();

  Future<Either<AppError, User?>> googleSignIn();

  Future<Either<AppError, User?>> phoneNumberSignIn(Map<String,dynamic> params);
}
