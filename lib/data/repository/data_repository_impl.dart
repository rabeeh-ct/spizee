
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:spizee/domain/entities/app_error.dart';
import 'package:spizee/domain/entities/home_screen_entity.dart';
import '../../domain/repository/data_repository.dart';
import '../data_sources/remote_data_source.dart';

class DataRepositoryImpl implements DataRepository {
  RemoteDataSource remoteDataSource = Get.find();

  @override
  Future<Either<AppError, List<HomeScreenEntity>>> getHomeScreenData() async {
    try {
      final response = await remoteDataSource.getHomeScreenData();
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

/*
  @override
  Future<Either<AppError, Entity>> fn(
      Map<String, dynamic> params) async {
    try {
      final response = await remoteDataSource.fn(params);
      return Right(response);
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
 */

}
