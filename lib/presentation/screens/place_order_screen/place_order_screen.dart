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
    final screenController = Get.put(PlaceOrderScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
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
                      child: const Text(
                        "2 Dishes - 2 Items",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    Divider(
                      color: blackColor.withOpacity(0.2),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => const OrderCard(),
                        separatorBuilder: (context, index) => Divider(
                          // height: 2,
                          color: blackColor.withOpacity(0.2),
                        ),
                        itemCount: 10,
                      ),
                    ),
                    Divider(
                      color: blackColor.withOpacity(0.2),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("$currency 65.00",style: TextStyle(
                            fontSize: 15,
                            color: greenColor
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            10.sBH,
            DefaultButton(
              backgroundColor: darkGreenColor,
              text: "Place Order",
              isLoading: false,
              borderRadius: 30,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
