import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/domain/usecases/phone_number_verify_usecase.dart';
import 'package:spizee/presentation/routes/route_constants.dart';
import 'package:spizee/utils/debug_utils.dart';

import '../../../utils/snackbar_utils.dart';
import '../home_screen/home_screen_controller.dart';

class VerifyOtpScreenController extends GetxController {
  VerifyOtpScreenArgs verifyOtpScreenArgs = Get.arguments;
  final TextEditingController otpTextController = TextEditingController();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>(debugLabel: "otpFormKey");

  // getData() {
  // }

  final _phoneNumberSignInUseCase = Get.put(PhoneNumberSignInUseCase());
  RxBool buttonLoading = false.obs;

  phoneNumberSignIn() async {
    buttonLoading(true);
    PhoneNumberSignInParams params = PhoneNumberSignInParams(
      smsCode: otpTextController.text.trim(),
      verificationId: verifyOtpScreenArgs.verificationId,
    );
    final response = await _phoneNumberSignInUseCase(params);
    response.fold((l) => l.handleError(error: l.message), (r) async {
      if (r != null) {
        consoleLog("user == $r");
        Get.offAllNamed(RouteList.homeScreen);
        Get.find<HomeScreenController>().getData();
      }
      // if(isNavigate){
      //   Get.offAllNamed(RouteList.initial);
      // }
    });
    buttonLoading(false);
  }
}

class VerifyOtpScreenArgs {
  final String verificationId;
  final String phoneNumber;

  VerifyOtpScreenArgs({required this.verificationId, required this.phoneNumber});
}
