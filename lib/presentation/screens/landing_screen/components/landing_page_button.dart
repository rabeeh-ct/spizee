import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/theme.dart';
import '../../../widgets/default_button.dart';

class LandingPageButton extends StatelessWidget {
  const LandingPageButton({super.key, required this.onClick, required this.svgPath, required this.text, required this.isLoading, this.backgroundColor, this.gradient});
  final VoidCallback onClick;
  final String svgPath;
  final String text;
  final bool isLoading;
  final Color? backgroundColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      backgroundColor: backgroundColor, // todo
      gradient: gradient,
      text: "",
      isLoading: isLoading,
      onPressed: onClick,
      height: 65,
      borderRadius: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          children: [
            SvgPicture.asset(svgPath,width: 25,),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            30.sBW,
          ],
        ),
      ),
    );
  }
}
