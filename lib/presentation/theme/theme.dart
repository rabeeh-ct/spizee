import 'package:flutter/material.dart';

const defaultPadding = 20.0;
const defaultAppBarHeight = 56.0;
const defaultSpacer = SizedBox(
  height: defaultPadding,
);
const defaultSpacerSmall = SizedBox(
  height: defaultPadding / 2,
);
const defaultSpacerHorizontal = SizedBox(width: defaultPadding);
const defaultSpacerHorizontalSmall = SizedBox(
  width: defaultPadding / 2,
);

const defaultAnimationDuration = Duration(milliseconds: 500);

const lightGrey = Color(0xFFEEEEEE);
const whiteColor = Colors.white;
const greyColor = Color(0xff959595);
const errorColor = Color(0xFFFC4444);
const blackColor = Color(0xff000000);
const greenColor = Color(0xff4aa850);
const lightGreenColor = Color(0xff8ad262);
const darkGreenColor = Color(0xff183c0e);

const defaultShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(2, 5),
    blurRadius: 5,
  )
];

extension Sizedbox on num {
  SizedBox get sBH => SizedBox(height: toDouble());
  SizedBox get sBW => SizedBox(width: toDouble());
}

extension StringExtension on String{
  String get upperFirst=>"${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

// extension SampleText on String {
//   Text get errorText => Text(toString(),style: const TextStyle(color: Colors.red),);
// }