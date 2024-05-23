// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';

import '../../common/constants.dart';
import '../../presentation/theme/theme.dart';

class AppError {
  final AppErrorType appErrorType;
  final String? message;

  AppError(this.appErrorType,[this.message]);

  handleError({String? error,Duration? duration}) {
    Get.snackbar("Unexpected Error", error??errorMessage(),
        backgroundColor: errorColor,
        colorText: whiteColor,
        isDismissible: true,
        duration: duration??const Duration(milliseconds: 700),
        animationDuration: const Duration(milliseconds: 400));
  }

  String errorMessage() {
    switch (appErrorType) {
      case AppErrorType.api:
        return apiError;
      case AppErrorType.network:
        return networkError;
      case AppErrorType.databse:
        return databseError;
      case AppErrorType.unauthorised:
        return unauthorisedError;
      case AppErrorType.sessionDenied:
        return sessionDeniedError;
      case AppErrorType.unexpected:
        return sessionDeniedError;
      case AppErrorType.firebase:
        return firebaseError;
    }
  }
}

enum AppErrorType {
  api,
  network,
  databse,
  unauthorised,
  sessionDenied,
  unexpected,
  firebase
}
