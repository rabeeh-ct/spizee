import 'package:get/get.dart';
import 'package:spizee/presentation/routes/route_constants.dart';
import 'package:spizee/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:spizee/utils/snackbar_utils.dart';

import '../../../domain/entities/home_screen_entity.dart';

class PlaceOrderScreenController extends GetxController {
  RxList<CategoryDish> cartItems = <CategoryDish>[].obs;

  // for fetching data that passed from the home screen
  getData() async {
    Rx<HomeScreenEntity> homeScreenEntity = Get.arguments;
    cartItems.clear();
    for (var element in homeScreenEntity.value.tableMenuList) {
      for (var e in element.categoryDishes) {
        if (e.cartCount > 0) {
          cartItems.add(e);
        }
      }
    }
  }

  // fot getting item count and total amount
  double getItemCount({required RxList<CategoryDish> cartItems, required bool isTotalAmount}) {
    double count = 0;
    double totalAmount = 0;
    for (var element in cartItems) {
      count += element.cartCount;
      totalAmount += (element.cartCount * element.dishPrice);
    }
    return isTotalAmount ? totalAmount : count;
  }

  RxBool placeOrderButtonLoading = false.obs;

  // place order function, wait 2 seconds for emitting real behaviour
  placeOrder() async {
    placeOrderButtonLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(RouteList.homeScreen);
    Get.delete<HomeScreenController>();
    // for show success message
    showMessage("Order Placed Successfully!\nThank you for your purchase. ",
        duration: const Duration(seconds: 2));
    placeOrderButtonLoading(false);
  }
}
