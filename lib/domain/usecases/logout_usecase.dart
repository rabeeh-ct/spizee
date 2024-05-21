import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../entities/app_error.dart';
import '../params/no_params.dart';
import '../repository/auth_repository.dart';
import 'usecase.dart';

class LogOutUseCase extends UseCase<dynamic,NoParams>{
  AuthenticationRepository authenticationRepository=Get.find();
  @override
  Future<Either<AppError, dynamic>> call(NoParams params, {Map<String, dynamic>? queryParameters}) async{
    return await authenticationRepository.logout();
  }

}