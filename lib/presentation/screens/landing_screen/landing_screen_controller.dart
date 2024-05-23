import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spizee/domain/entities/app_error.dart';
import 'package:spizee/domain/usecases/google_sign_in_usecase.dart';
import 'package:spizee/presentation/screens/verify_otp_screen/verify_otp_screen_controller.dart';
import 'package:spizee/utils/hide_keyboard.dart';

import '../../../domain/params/no_params.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/usecases/phone_number_verify_usecase.dart';
import '../../../utils/debug_utils.dart';
import '../../routes/route_constants.dart';
import '../home_screen/home_screen_controller.dart';

class LandingScreenController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> phoneVerifyFormKey = GlobalKey(debugLabel: "phoneVerifyFormKey");

  final _googleSignInUseCase = Get.put(GoogleSignInUseCase());
  final _logOutUseCase = Get.put(LogOutUseCase());

  RxBool googleButtonLoading = false.obs;
  RxBool phoneButtonLoading = false.obs;
  RxBool logOutButtonLoading = false.obs;

  googleSignIn() async {
    googleButtonLoading(true);
    // await logOut();
    NoParams noParams = const NoParams();
    final response = await _googleSignInUseCase(noParams);
    response.fold((l) => l.handleError(), (r) async {
      if (r != null) {
        consoleLog(r);
        Get.offAllNamed(RouteList.homeScreen);
        Get.find<HomeScreenController>().getData();
      } else {}
    });
    googleButtonLoading(false);
  }

  logOut({bool isNavigate = false}) async {
    logOutButtonLoading(true);
    NoParams noParams = const NoParams();
    final response = await _logOutUseCase(noParams);
    response.fold((l) => l.handleError(), (r) async {
      if (isNavigate) {
        Get.offAllNamed(RouteList.initial);
      }
    });
    logOutButtonLoading(false);
  }

  phoneNumberVerify() async {
    phoneButtonLoading(true);
    FirebaseAuth auth = FirebaseAuth.instance;
    String phoneNumber="+91${phoneController.text.trim()}";
    consoleLog("phoneNumber $phoneNumber");
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (error) {
        AppError(AppErrorType.firebase)
            .handleError(error: error.message, duration: const Duration(seconds: 3));
        phoneButtonLoading(false);
      },
      codeSent: (String verificationId, int? resendToken) async {
        consoleLog("verificationId >>>>>>> $verificationId");
        Get.toNamed(RouteList.verifyOtpScreen,
                arguments: VerifyOtpScreenArgs(
                    verificationId: verificationId, phoneNumber: phoneNumber))
            ?.then((value) {
          HideKeyboard.hideKeyboard(Get.context!);
          Get.delete<VerifyOtpScreenController>();
        });
        // Get.put(VerifyOtpScreenController()).getData();
        phoneButtonLoading(false);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    // phoneButtonLoading(false);
  }
}
