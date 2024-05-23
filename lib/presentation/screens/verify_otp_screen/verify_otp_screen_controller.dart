import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/utils/debug_utils.dart';

import '../../../domain/usecases/phone_number_verify_usecase.dart';
import '../../routes/route_constants.dart';

class VerifyOtpScreenController extends GetxController {
  VerifyOtpScreenArgs verifyOtpScreenArgs = Get.arguments;
  final TextEditingController otpTextController = TextEditingController();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>(debugLabel: "otpFormKey");

  final _phoneNumberSignInUseCase = Get.put(PhoneNumberSignInUseCase());
  RxBool buttonLoading = false.obs;

  // for verify the otp and sign in,
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
      }
    });
    buttonLoading(false);
  }
}

class VerifyOtpScreenArgs {
  final String verificationId;
  final String phoneNumber;

  VerifyOtpScreenArgs({required this.verificationId, required this.phoneNumber});
}
