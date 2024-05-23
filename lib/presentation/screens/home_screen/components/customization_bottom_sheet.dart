import 'package:flutter/material.dart';

import '../../../../domain/entities/home_screen_entity.dart';
import '../../../theme/theme.dart';
import '../../../widgets/bottom_sheet_small_container.dart';

class CustomizationBottomSheet extends StatelessWidget {
  const CustomizationBottomSheet({super.key, required this.addOnCategories});

  final List<AddonCat> addOnCategories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(defaultPadding),
          topLeft: Radius.circular(defaultPadding),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultSpacer,
              const Center(child: BottomSheetSmallContainer()),
              defaultSpacer,
              ...List.generate(
                addOnCategories.length,
                (index) => ListTile(
                  title: Text(
                    addOnCategories[index].addonCategory,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
