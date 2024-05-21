import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ExpandedElivatedButton extends StatelessWidget {
  const ExpandedElivatedButton({
    Key? key,
    required this.text,
    this.backgroundColor = primaryColor,
    this.borderColor = primaryColor,
    this.textColor = whiteColor,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: BorderSide(color: borderColor))),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                    vertical: defaultPadding / 1.4))),
            onPressed: () => onPressed(),
            child: Text(
              text,
              textScaleFactor: 1.0,
              style: TextStyle(color: textColor),
            )));
  }
}
