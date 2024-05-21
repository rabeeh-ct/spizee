import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/presentation/routes/route_constants.dart';
import 'package:spizee/presentation/screens/landing_screen/components/landing_page_button.dart';
import 'package:spizee/presentation/theme/theme.dart';

import 'landing_screen_controller.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LandingScreenController screenController = Get.put(LandingScreenController());
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (Get.width / 4).sBH,
            Image.asset(
              "assets/images/firebase_logo.png",
              width: 200,
            ),
            (Get.width / 4).sBH,
            LandingPageButton(
              backgroundColor: Colors.blue.shade600,
              onClick: () {
                screenController.googleSignIn();
                // Get.toNamed(RouteList.homeScreen);
              },
              svgPath: "assets/images/google.svg",
              text: "Google",
              isLoading: false,
            ),
            10.sBH,
            LandingPageButton(
              gradient: const LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  lightGreenColor,
                  greenColor,
                ],
              ),
              onClick: () {
                Get.toNamed(RouteList.homeScreen);
              },
              svgPath: "assets/images/phone.svg",
              text: "Phone",
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
