import 'package:flutter/material.dart';

import '../theme/theme.dart';

class PaginationIndicator extends StatelessWidget {
  const PaginationIndicator(
      {Key? key,
      required this.isLoading,
      required this.moreItemsAvailable,
      this.loadingWidget,
      required this.length})
      : super(key: key);
  final bool isLoading;
  final bool moreItemsAvailable;
  final Widget? loadingWidget;
  final int length;

  @override
  Widget build(BuildContext context) {
    return !moreItemsAvailable
        ? length > 4
            ? const Center(
                child: Divider(
                endIndent: defaultPadding * 5,
                indent: defaultPadding * 5,
                color: greyColor,
                thickness: defaultPadding / 10,
              ))
            : const SizedBox.shrink()
        : isLoading
            ? loadingWidget!
            : const SizedBox.shrink();
  }
}
