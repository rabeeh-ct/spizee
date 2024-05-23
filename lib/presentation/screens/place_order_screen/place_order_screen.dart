import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/common/constants.dart';
import 'package:spizee/presentation/screens/place_order_screen/components/order_card.dart';
import 'package:spizee/presentation/widgets/default_button.dart';

import '../../theme/theme.dart';
import 'place_order_screen_controller.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PlaceOrderScreenController screenController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: whiteColor,
        scrolledUnderElevation: 5,
        title: const Text(
          "Order Summary",
        ),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: whiteColor, boxShadow: defaultShadow),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      color: darkGreenColor,
                      alignment: Alignment.center,
                      child: Obx(() {
                        return Text(
                          "${screenController.cartItems.length} Dishes - ${screenController.getItemCount(cartItems: screenController.cartItems, isTotalAmount: false).toInt()} Items",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: whiteColor,
                          ),
                        );
                      }),
                    ),
                    Divider(
                      color: blackColor.withOpacity(0.2),
                    ),
                    Expanded(
                      child: screenController.cartItems.isNotEmpty?ListView.separated(
                        itemBuilder: (context, index) => OrderCard(
                          categoryDish: screenController.cartItems[index].obs,
                        ),
                        separatorBuilder: (context, index) => Divider(
                          // height: 2,
                          color: blackColor.withOpacity(0.2),
                        ),
                        itemCount: screenController.cartItems.length,
                      ):const Center(
                        child: Text(
                          "Your cart is empty"
                        ),
                      ),
                    ),
                    Divider(
                      color: blackColor.withOpacity(0.2),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Amount",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(() {
                            return Text(
                              "$currency ${screenController.getItemCount(cartItems: screenController.cartItems, isTotalAmount: true).toStringAsFixed(2)}",
                              style: const TextStyle(fontSize: 15, color: greenColor),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.sBH,
            Obx(() {
                return DefaultButton(
                  backgroundColor: darkGreenColor,
                  text: "Place Order",
                  isLoading: screenController.placeOrderButtonLoading.value,
                  borderRadius: 30,
                  onPressed: screenController.placeOrder,
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
