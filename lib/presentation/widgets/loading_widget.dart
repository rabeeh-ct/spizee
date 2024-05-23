import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ButtonLoadingWidget extends StatelessWidget {
  const ButtonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: defaultPadding,
      width: defaultPadding,
      child: CupertinoActivityIndicator(
        color: Colors.white,
        // strokeWidth: 2,
      ),
    );
  }
}
