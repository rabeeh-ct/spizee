import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/presentation/routes/route_constants.dart';
import 'package:spizee/presentation/screens/home_screen/components/home_screen_drawer.dart';
import 'package:spizee/presentation/screens/home_screen/components/item_card.dart';
import 'package:spizee/presentation/theme/theme.dart';
import 'package:spizee/presentation/widgets/network_resource.dart';

import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController screenController = Get.find();
    return Obx(() {
      return NetworkResource(
        retry: screenController.getData,
        loading: screenController.pageLoading.value,
        appError: screenController.appError,
        child: screenController.homeScreenEntity.value == null
            ? const SizedBox.shrink()
            : DefaultTabController(
                length: screenController
                    .homeScreenEntity.value!.tableMenuList.length,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 5,
                    shadowColor: Colors.white,
                    scrolledUnderElevation: 5,
                    backgroundColor: whiteColor,
                    centerTitle: true,
                    leading: const DrawerButton(),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(RouteList.placeOrderScreen,arguments: screenController.homeScreenEntity);
                          },
                          child: Obx(() {
                              return Badge(
                                label: Text(screenController.cartCount.value.toString()),
                                child: const Icon(Icons.shopping_cart),
                              );
                            }
                          ),
                        ),
                      ),
                    ],
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(30.0),
                      child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        padding: EdgeInsets.zero,
                        tabs: [
                          ...List.generate(
                            screenController
                                .homeScreenEntity.value!.tableMenuList.length,
                            (index) => Tab(
                              child: Text(
                                screenController.homeScreenEntity.value!
                                    .tableMenuList[index].menuCategory,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      ...List.generate(
                        screenController
                            .homeScreenEntity.value!.tableMenuList.length,
                        (index) => ListView.separated(
                          itemBuilder: (context, i) => ItemCard(
                            categoryDish: screenController.homeScreenEntity
                                .value!.tableMenuList[index].categoryDishes[i],
                          ),
                          separatorBuilder: (context, _) => Divider(
                            // height: 2,
                            color: blackColor.withOpacity(0.2),
                          ),
                          itemCount: screenController.homeScreenEntity.value!
                              .tableMenuList[index].categoryDishes.length,
                        ),
                      ),
                    ],
                  ),
                  drawer: const HomeScreenDrawer(),
                ),
              ),
      );
    });
  }
}
