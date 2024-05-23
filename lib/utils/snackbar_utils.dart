import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/theme/theme.dart';

showMessage(String message, {Duration? duration, bool isError = false}) {
  Get.showSnackbar(
    GetSnackBar(
      snackStyle: SnackStyle.FLOATING,
      icon: isError
          ? const Icon(
              Icons.error_outline,
              color: Colors.red,
            )
          : null,
      messageText: Text(
        message,
        style:
            Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      duration: duration ?? (isError?const Duration(milliseconds: 1500):const Duration(milliseconds: 1000)),
      borderRadius: defaultPadding / 2,
      backgroundColor: Get.isDarkMode ? const Color(0xff28353e) : lightGrey,
      animationDuration: const Duration(milliseconds: 600),
      margin:
          const EdgeInsets.symmetric(horizontal: defaultPadding / 2, vertical: defaultPadding),
    ),
  );
}
