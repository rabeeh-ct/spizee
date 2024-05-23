import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/presentation/screens/landing_screen/landing_screen_controller.dart';

import '../../../theme/theme.dart';
import '../../../widgets/bottom_sheet_small_container.dart';
import '../../../widgets/default_button.dart';

class PhoneNumberVerifyBottomSheet extends StatelessWidget {
  const PhoneNumberVerifyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingScreenController screenController = Get.find();
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(defaultPadding),
          topLeft: Radius.circular(defaultPadding),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: SingleChildScrollView(
          child: Form(
            key: screenController.phoneVerifyFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defaultSpacer,
                const Center(child: BottomSheetSmallContainer()),
                defaultSpacer,
                Text(
                  "Enter Phone Number",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Get.isDarkMode ? greyColor : null, fontSize: 13),
                ),
                defaultSpacerSmall,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding/2),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Center(
                          child: Text("+91"),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) => value == "" ? "This field required" : null,
                          controller: screenController.phoneController,

                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding/2),
                            border: InputBorder.none,
                            hintText: "Number without Country code",
                            hintStyle: TextStyle(
                                fontSize: 13, color: greyColor, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                defaultSpacer,
                Obx(() {
                  return DefaultButton(
                    borderRadius: 30,
                    text: "VERIFY",
                    backgroundColor: greenColor,
                    // borderColor: primaryColor,
                    isLoading: screenController.phoneButtonLoading.value,
                    onPressed: () {
                      screenController.phoneVerifyFormKey.currentState!.validate()
                          ? screenController.phoneNumberVerify()
                          : null;
                    },
                    // height: defaultPadding * 2.8,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
