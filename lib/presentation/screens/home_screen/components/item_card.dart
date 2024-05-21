import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/common/constants.dart';
import 'package:spizee/presentation/screens/home_screen/components/quantity_change_button.dart';
import 'package:spizee/presentation/theme/theme.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding/2),
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
                decoration: const BoxDecoration(shape: BoxShape.circle, color: greenColor),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "The standard chunk of Lorem Ipsum used since the",
                      // maxLines: 2,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600
                          // overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    5.sBH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$currency ${(5).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "15 Calories",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    10.sBH,
                    const Text(
                      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    10.sBH,
                    QuantityChangeButton(
                      addButton: () {},
                      removeButton: () {},
                    ),

                    10.sBH,
                    const Text(
                      'Customizations Available',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                height: 100,
                color: Colors.green.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
