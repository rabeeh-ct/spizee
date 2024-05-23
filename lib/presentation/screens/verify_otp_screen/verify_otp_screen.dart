import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../../widgets/default_button.dart';
import 'verify_otp_screen_controller.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyOtpScreenController screenController = Get.put(VerifyOtpScreenController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (Get.height*.15).sBH,
              SvgPicture.asset(
                "assets/images/phone_verify.svg",
              ),
              defaultSpacer,
              Text(
                "Confirm your phone number",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
                textScaler: TextScaler.noScaling,
              ),
              defaultSpacer,
              Text(
                "To verify your number, we’ve sent a One Time Password(OTP) to ${screenController.verifyOtpScreenArgs.phoneNumber}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                textScaler: TextScaler.noScaling,
              ),
              defaultSpacer,
              Form(
                key: screenController.otpFormKey,
                child: TextFormField(
                  controller: screenController.otpTextController,
                  decoration: const InputDecoration(
                    hintText: "code",
                    hintStyle: TextStyle(letterSpacing: 0),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: const TextStyle(letterSpacing: 4),
                  validator: (value) {
                    return value == null || value == ""
                        ? "Please enter verification code"
                        : null;
                  },
                ),
              ),
              defaultSpacerSmall,
              Obx(() {
                return DefaultButton(
                  height: defaultPadding * 3,
                  text: "CONFIRM",
                  isLoading: screenController.buttonLoading.value,
                  onPressed: () {
                    screenController.otpFormKey.currentState!.validate()
                        ? screenController.phoneNumberSignIn()
                        : null;
                  },
                );
              }),
            ],
          ),
        ),
    );
  }
}
