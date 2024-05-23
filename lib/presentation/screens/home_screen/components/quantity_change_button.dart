import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/presentation/screens/home_screen/home_screen_controller.dart';

import '../../../../domain/entities/home_screen_entity.dart';
import '../../../theme/theme.dart';

class QuantityChangeButton extends StatelessWidget {
  const QuantityChangeButton({
    super.key,
    this.buttonColor,
    required this.categoryDish, this.categoryDishes,
  });

  final Color? buttonColor;
  final Rx<CategoryDish> categoryDish;
  final RxList<CategoryDish>? categoryDishes;

  @override
  Widget build(BuildContext context) {
    final HomeScreenController screenController=Get.find();
    return Container(
      width: 120,
      height: 35,
      decoration: BoxDecoration(
        color: buttonColor ?? greenColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                // screenController.dishItems[categoryDish.value]=screenController.dishItems[categoryDish.value]=(screenController.dishItems[categoryDish.value]!-1);
                if(categoryDish.value.cartCount>0){
                  categoryDish.value.cartCount--;
                  categoryDish.refresh();
                  screenController.changeCartCount(isAdd: false);
                  categoryDishes?.refresh();
                }
              },
              child: const Icon(
                Icons.remove,
                color: whiteColor,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Obx(() {
                  return Text(
                    categoryDish.value.cartCount.toString(),
                    style: const TextStyle(
                      color: whiteColor,
                    ),
                  );
                }
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                categoryDish.value.cartCount++;
                categoryDish.refresh();
                screenController.changeCartCount(isAdd: true);
                categoryDishes?.refresh();
              },
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
