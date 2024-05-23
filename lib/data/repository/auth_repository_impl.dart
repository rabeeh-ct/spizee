import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:spizee/utils/debug_utils.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource =
  Get.find();

  @override
  Future<Either<AppError, void>> logout() async {
    // consoleLog("data");
    try {
      final response = await authenticationRemoteDataSource.logout();
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, User?>> googleSignIn() async {
    try {
      final response = await authenticationRemoteDataSource.googleSignIn();
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, User?>> phoneNumberSignIn(Map<String,dynamic> params) async {
    try {
      final response = await authenticationRemoteDataSource.phoneNumberSignIn(params);
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on FirebaseAuthException catch(e) {
      consoleLog(":::::::::::::::::::");
      return Left(AppError(AppErrorType.firebase,e.message));
    }on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
