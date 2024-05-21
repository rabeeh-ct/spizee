import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class QuantityChangeButton extends StatelessWidget {
  const QuantityChangeButton({super.key, required this.removeButton, required this.addButton, this.buttonColor});

  final VoidCallback removeButton;
  final VoidCallback addButton;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 35,
      decoration: BoxDecoration(
        color: buttonColor??greenColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: removeButton,
              child: const Icon(
                Icons.remove,
                color: whiteColor,
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "5",
                style: TextStyle(
                  color: whiteColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: addButton,
              child: const Icon(
                Icons.add,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
