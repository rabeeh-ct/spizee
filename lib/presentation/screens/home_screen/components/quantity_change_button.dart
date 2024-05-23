import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/presentation/screens/home_screen/home_screen_controller.dart';

import '../../../../domain/entities/home_screen_entity.dart';
import '../../../theme/theme.dart';

class QuantityChangeButton extends StatelessWidget {
  const QuantityChangeButton({
    super.key,
    required this.removeButton,
    required this.addButton,
    this.buttonColor,
    required this.categoryDish,
  });

  final VoidCallback removeButton;
  final VoidCallback addButton;
  final Color? buttonColor;
  final Rx<CategoryDish> categoryDish;

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
                if(categoryDish.value.cartCount>0){
                  categoryDish.value.cartCount--;
                  categoryDish.refresh();
                  screenController.changeCartCount(isAdd: false);
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
