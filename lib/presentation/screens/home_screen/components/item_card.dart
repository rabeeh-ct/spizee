import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/common/constants.dart';
import 'package:spizee/presentation/screens/home_screen/components/quantity_change_button.dart';
import 'package:spizee/presentation/theme/theme.dart';

import '../../../../domain/entities/home_screen_entity.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.categoryDish});

  final CategoryDish categoryDish;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      // color: Get.theme.scaffoldBackgroundColor,
      // width: double.maxFinite,
      // height: 100,
      // color: Colors.red,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: greenColor)),
              width: 20,
              height: 20,
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: greenColor),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryDish.dishName,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    5.sBH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$currency ${(categoryDish.dishPrice).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${categoryDish.dishCalories.toInt()} calories",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    10.sBH,
                    Text(
                      categoryDish.dishDescription,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    10.sBH,
                    QuantityChangeButton(
                      categoryDish: categoryDish.obs,
                      addButton: () {},
                      removeButton: () {},
                    ),
                    10.sBH,
                    if (categoryDish.addonCat.isNotEmpty)
                      const Text(
                        'Customizations Available',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.maxFinite,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                  imageUrl: categoryDish.dishImage,
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
