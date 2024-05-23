import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../entities/app_error.dart';
import '../repository/auth_repository.dart';
import 'usecase.dart';

class PhoneNumberSignInUseCase extends UseCase<User?, PhoneNumberSignInParams> {
  AuthenticationRepository authenticationRepository = Get.find();

  @override
  Future<Either<AppError, User?>> call(PhoneNumberSignInParams params,
      {Map<String, dynamic>? queryParameters}) async {
    return await authenticationRepository.phoneNumberSignIn(params.toMap());
  }
}

class PhoneNumberSignInParams {
  final String smsCode;
  final String verificationId;

  PhoneNumberSignInParams({required this.smsCode, required this.verificationId});

  Map<String, dynamic> toMap() => {
        "sms_code": smsCode,
        "verification_id": verificationId,
      };
}
