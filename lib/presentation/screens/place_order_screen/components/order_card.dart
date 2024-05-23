import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/presentation/theme/theme.dart';

import '../../../../common/constants.dart';
import '../../../../domain/entities/home_screen_entity.dart';
import '../../home_screen/components/quantity_change_button.dart';
import '../place_order_screen_controller.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.categoryDish});
  final Rx<CategoryDish> categoryDish;

  @override
  Widget build(BuildContext context) {
    final PlaceOrderScreenController screenController = Get.find();
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: EdgeInsets.zero,
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
                  Text(
                    categoryDish.value.dishName,
                    // maxLines: 2,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  5.sBH,
                  Text(
                    "$currency ${(categoryDish.value.dishPrice).toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${categoryDish.value.dishCalories.toInt()} Calories",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
            ),
          ),
          QuantityChangeButton(
            categoryDishes: screenController.cartItems,
            categoryDish: categoryDish,
            buttonColor: darkGreenColor,
          ),
          5.sBW,
          Obx(() {
              return SizedBox(
                // color: Colors.red,
                width: 80,
                child: Text(
                  "$currency ${(categoryDish.value.dishPrice*categoryDish.value.cartCount).toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }
          ),

        ],
      ),
    );
  }
}
