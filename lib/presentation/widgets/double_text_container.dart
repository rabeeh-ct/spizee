import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class DoubleTextContainer extends StatelessWidget {
  const DoubleTextContainer(
      {Key? key, required this.headLine, required this.subTitle})
      : super(key: key);
  final String headLine;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: defaultPadding * 5,
      height: defaultPadding * 3.5,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              headLine,
              textScaleFactor: 1.0,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Get.isDarkMode ? primaryColor : null,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              subTitle,
              textScaleFactor: 1.0,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12, color: Get.isDarkMode ? greyColor : null),
            ),
          ],
        ),
      ),
      // color: Colors.blue,
    );
  }
}
