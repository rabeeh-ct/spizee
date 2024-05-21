import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/presentation/screens/landing_screen/landing_screen_controller.dart';

import '../../../theme/theme.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width * .9,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            width: double.maxFinite,
            height: Get.height * .3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  greenColor,
                  lightGreenColor,
                ],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 45,
                ),
                10.sBH,
                const Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                10.sBH,
                const Text(
                  "ID 000",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                ListTile(
                  minLeadingWidth: 50,
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Get.put(LandingScreenController()).logOut(isNavigate: true);
                  },
                  title: const Text(
                    "Log out",
                    style: TextStyle(color: greyColor, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
