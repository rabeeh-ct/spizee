import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource =
  Get.find();
  final AuthenticationLocalDataSource _authenticationLocalDataSource =
  Get.find();
//
  @override
  Future<Either<AppError, UserEntity>> login(
      Map<String, dynamic> params) async {
    // consoleLog("data");
    try {
      final response = await authenticationRemoteDataSource.login(params);
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
  Future<Either<AppError, UserEntity>> register(
      Map<String, dynamic> params) async {
    // consoleLog("data");
    try {
      final response = await authenticationRemoteDataSource.register(params);
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
  Future<Either<AppError, void>> deleteUserLocal() async {
    try {
      final response = _authenticationLocalDataSource.deleteUser();
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
  Future<Either<AppError, UserEntity?>> getUserLocal() async {
    try {
      final response = _authenticationLocalDataSource.getUser();
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
  Future<Either<AppError, void>> saveUserLocal(UserEntity params) async {
    try {
      final response = _authenticationLocalDataSource.saveUser(UserModel(
        name: params.name,
        email: params.email,
        userId: params.userId,
        role: params.role,
      ));
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
  Future<Either<AppError, User?>> phoneNumberSignIn(String params) async {
    try {
      final response = await authenticationRemoteDataSource.phoneNumberSignIn(params);
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
