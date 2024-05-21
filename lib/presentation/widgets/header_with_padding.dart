import 'package:flutter/material.dart';

import '../theme/theme.dart';

class HeaderWithPadding extends StatelessWidget {
  const HeaderWithPadding({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Text(
        text,
        textScaleFactor: 1.0,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
